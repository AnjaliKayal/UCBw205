import tweepy

consumer_key = "icaCY6OnSfPDIsCsD46URRyVw";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "1NQbo0y9jrZUIpAMyKaeXGZB3TTUMPyPJpg3uVdUvaqLyKGoYR";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "754506992799125504-jDYm0Y4J7Tlp05mgc3JPkCeiGVuP4VB";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "i24eRi00BGAeEoJpbChEfS0xe8RN2WwBr8pUixR1On6jq";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



