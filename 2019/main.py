from bs4 import BeautifulSoup
from requests import request
import re
from datetime import datetime, timedelta
import json
import os
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

base_domain = "https://fortee.jp/"

class Proposal:
    schedule = ""
    track = ""
    time_length = 0
    title = ""
    speaker_img_url = ""
    speaker_name = ""
    twitter_name = ""
    twitter_link = ""
    abstract = ""
    avatar_imgurl = ""
    data_uuid = ""
   

    def __init__(self, soup):
        start_time_text = soup.find("span", {"class": "schedule"}).text[:-1]
        staret_datetime = datetime.strptime(start_time_text, '%Y/%m/%d %H:%M')
        self.schedule = staret_datetime.isoformat() + "+09:00"
        self.track = soup.find("span", {"class": "track"}).text
        time_text = soup.find("span", {"class": "name"}).text
        self.time_length = int(re.search(r'\d{1,2}', time_text)[0])
        self.title = soup.findAll("a")[0].text
        
        speaker_soup = soup.find("div", {"class": "speaker"})
        self.speaker_name = speaker_soup.find("span").text.strip()
        twitter_soup = speaker_soup.find("span", {"class": "left20"})

        if twitter_soup is not None:
            twitter_link = twitter_soup.find('a')
            self.twitter_name = twitter_link.text
            self.twitter_link = twitter_link.get('href')
        
        avatar_img_soup = speaker_soup.find("img")

        if avatar_img_soup is not None:
            self.avatar_imgurl = base_domain + avatar_img_soup.get("src")
            
        
        self.abstract = soup.find("div", {"class": "abstract"}).text.strip()
        self.data_uuid = soup.find("div", {"class": "status-bar"}).find("div", {"class": "fav"}).get("data-uuid")

        
    def to_dict(self):
        result = {}
        result["uuid"] = self.data_uuid
        result["title"] = self.title
        result["abstract"] = self.abstract
        result["slide"] = ""
        
        speaker = {}
        speaker["name"] = self.speaker_name
        speaker["twitter"] = self.twitter_name
        speaker["avatar_url"] = self.avatar_imgurl
        result["speaker"] = speaker

        timetable = {}
        timetable["track"] = self.track
        timetable["starts_at"] = self.schedule
        timetable["length_min"] = self.time_length
        result["timetable"] = timetable
        return result


def get_headers():
    headers = {    
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36',    
        'Connection': 'keep-alive',       
        'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
    }
    return headers

def get_proposals(url, db_ref):
    headers = get_headers()
    html_text = request(method = "get", url = url, headers = headers).text
    soup = BeautifulSoup(html_text)
    proposals = soup.findAll("div", {"class": "list-proposal proposal-detail"})
    result = []
    for proposal in proposals:
        proposal_dict = Proposal(soup = proposal).to_dict()
        result.append(proposal_dict)
        db_ref.document(proposal_dict["uuid"]).set(proposal_dict)

    return result

def get_db():
    cred = credentials.Certificate("key.json")
    firebase_admin.initialize_app(cred)
    db = firestore.client()
    db_ref = db.collection("proposals19")
    return db_ref
    

def main():
    base_url = "https://fortee.jp/iosdc-japan-2019/proposal?page="
    pages = [1,2,3,4]
    all_proposals = []

    db_ref = get_db()

    for page in pages:
        print(page)
        url = base_url + str(page)
        proposals = get_proposals(url, db_ref)
        all_proposals += proposals

    # json_str = json.dumps({"proposals": all_proposals}, ensure_ascii=False)
    # file_object = open("proposals_2019.json", "w")
    # file_object.write(json_str)
    # file_object.close()


if __name__ == "__main__":
    main()
