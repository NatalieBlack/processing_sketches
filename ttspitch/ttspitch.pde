import guru.ttslib.*;
import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import java.util.*;

Twitter twitter;
TTS tts;
String searchString = "digital art";
List<Status> tweets;
int WINDOWSIZE;
int currentTweet;

void setup() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("zTgTohMFt2BnmlXXLxDQ");
  cb.setOAuthConsumerSecret("NarBbSNGFt7ar72FSyK7KsLFU4vBZ1UhsBKvjCkwRWM");
  cb.setOAuthAccessToken("1673752057-dGufVlt7uYTth50BkfHK4sGOJrBj44eywyF16LN");
  cb.setOAuthAccessTokenSecret("0SSweMpnEy3cTT1azqHgawTlORsqmShY4tnY1ji0Y");
  TwitterFactory tf = new TwitterFactory(cb.build());
  twitter = tf.getInstance();
  WINDOWSIZE = 300;
  tts = new TTS();
  size(WINDOWSIZE,WINDOWSIZE);
  getNewTweets();
  currentTweet = 0;
}
void getNewTweets()
{
    try 
    {
        Query query = new Query(searchString);

        QueryResult result = twitter.search(query);

        tweets = result.getTweets();
    } 
    catch (TwitterException te) 
    {
        System.out.println("Failed to search tweets: " + te.getMessage());
        System.exit(-1);
    } 
}
void draw() {
  tts.setPitch( map(mouseX, 0, WINDOWSIZE, 50, 450) );
  //tts.setPitchRange( 0 )
  //tts.setPitchShift( mouseX/100 );
     fill(0, 40);
    rect(0, 0, width, height);

    currentTweet = currentTweet + 1;

    if (currentTweet >= tweets.size())
    {
        currentTweet = 0;
    }

    Status status = tweets.get(currentTweet);

    fill(200);
    text(status.getText(), random(width), random(height), 300, 200);
    tts.speak(status.getText());
    delay(250);
}

void mousePressed() {
  tts.speak("hello");
}

