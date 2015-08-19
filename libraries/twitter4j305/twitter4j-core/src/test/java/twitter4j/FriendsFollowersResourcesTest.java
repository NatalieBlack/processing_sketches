/*
 * Copyright 2007 Yusuke Yamamoto
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package twitter4j;

import twitter4j.json.DataObjectFactory;

/**
 * @author Yusuke Yamamoto - yusuke at mac.com
 * @since Twitter4J 2.2.4
 */
public class FriendsFollowersResourcesTest extends TwitterTestBase {
    public FriendsFollowersResourcesTest(String name) {
        super(name);
    }

    protected void setUp() throws Exception {
        super.setUp();
    }

    protected void tearDown() throws Exception {
        super.tearDown();
    }

    public void testSocialGraphMethods() throws Exception {
        IDs ids;
        ids = twitter1.getFriendsIDs(-1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        int yusukey = 4933401;
        assertIDExsits("twit4j is following yusukey", ids, yusukey);
        long ryunosukey = 48528137;
        ids = twitter1.getFriendsIDs(ryunosukey, -1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        assertEquals(ids, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(ids)));
        assertEquals("ryunosukey is not following anyone", 0, ids.getIDs().length);
        ids = twitter1.getFriendsIDs("yusukey", -1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        assertIDExsits("yusukey is following ryunosukey", ids, ryunosukey);
        IDs obamaFollowers;
        obamaFollowers = twitter1.getFollowersIDs("barackobama", -1);
        assertNotNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertEquals(obamaFollowers, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFollowers)));
        assertTrue(obamaFollowers.hasNext());
        assertFalse(obamaFollowers.hasPrevious());
        obamaFollowers = twitter1.getFollowersIDs("barackobama", obamaFollowers.getNextCursor());
        assertEquals(obamaFollowers, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFollowers)));
        assertNotNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertTrue(obamaFollowers.hasNext());
        assertTrue(obamaFollowers.hasPrevious());

        obamaFollowers = twitter1.getFollowersIDs(813286, -1);
        assertNotNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertEquals(obamaFollowers, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFollowers)));
        assertTrue(obamaFollowers.hasNext());
        assertFalse(obamaFollowers.hasPrevious());
        obamaFollowers = twitter1.getFollowersIDs(813286, obamaFollowers.getNextCursor());
        assertNotNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertEquals(obamaFollowers, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFollowers)));
        assertTrue(obamaFollowers.hasNext());
        assertTrue(obamaFollowers.hasPrevious());

        IDs obamaFriends;
        obamaFriends = twitter1.getFriendsIDs("barackobama", -1);
        assertNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertNotNull(DataObjectFactory.getRawJSON(obamaFriends));
        assertEquals(obamaFriends, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFriends)));
        assertTrue(obamaFriends.hasNext());
        assertFalse(obamaFriends.hasPrevious());
        obamaFriends = twitter1.getFriendsIDs("barackobama", obamaFriends.getNextCursor());
        assertNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertNotNull(DataObjectFactory.getRawJSON(obamaFriends));
        assertEquals(obamaFriends, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFriends)));
        assertTrue(obamaFriends.hasNext());
        assertTrue(obamaFriends.hasPrevious());

        obamaFriends = twitter1.getFriendsIDs(813286, -1);
        assertNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertNotNull(DataObjectFactory.getRawJSON(obamaFriends));
        assertEquals(obamaFriends, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFriends)));
        assertTrue(obamaFriends.hasNext());
        assertFalse(obamaFriends.hasPrevious());
        obamaFriends = twitter1.getFriendsIDs(813286, obamaFriends.getNextCursor());
        assertNull(DataObjectFactory.getRawJSON(obamaFollowers));
        assertNotNull(DataObjectFactory.getRawJSON(obamaFriends));
        assertEquals(obamaFriends, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(obamaFriends)));
        assertTrue(obamaFriends.hasNext());
        assertTrue(obamaFriends.hasPrevious());

        try {
            twitter2.createFriendship(id1.screenName);
        } catch (TwitterException ignore) {
        }
        ids = twitter1.getFollowersIDs(-1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        assertEquals(ids, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(ids)));
        assertIDExsits("twit4j2 is following twit4j", ids, 6377362);
        ids = twitter1.getFollowersIDs(ryunosukey, -1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        assertEquals(ids, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(ids)));
        assertIDExsits("yusukey is following ryunosukey", ids, yusukey);
        ids = twitter1.getFollowersIDs("ryunosukey", -1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        assertEquals(ids, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(ids)));
        assertIDExsits("yusukey is following ryunosukey", ids, yusukey);
    }

    private void assertIDExsits(String assertion, IDs ids, long idToFind) {
        boolean found = false;
        for (long id : ids.getIDs()) {
            if (id == idToFind) {
                found = true;
                break;
            }
        }
        assertTrue(assertion, found);
    }
    public void testCreateDestroyFriend() throws Exception {
        User user;
        try {
            user = twitter2.destroyFriendship(id1.screenName);
            assertNotNull(DataObjectFactory.getRawJSON(user));
            assertEquals(user, DataObjectFactory.createUser(DataObjectFactory.getRawJSON(user)));
        } catch (TwitterException te) {
            //ensure destory id1 before the actual test
        }

        try {
            user = twitter2.destroyFriendship(id1.screenName);
            assertNotNull(DataObjectFactory.getRawJSON(user));
            assertEquals(user, DataObjectFactory.createUser(DataObjectFactory.getRawJSON(user)));
        } catch (TwitterException te) {
            assertEquals(403, te.getStatusCode());
        }
        user = twitter2.createFriendship(id1.screenName, true);
        assertNotNull(DataObjectFactory.getRawJSON(user));
        assertEquals(user, DataObjectFactory.createUser(DataObjectFactory.getRawJSON(user)));
        assertEquals(id1.screenName, user.getScreenName());
        // the Twitter API is not returning appropriate notifications value
        // http://code.google.com/p/twitter-api/issues/detail?id=474
//        User detail = twitterAPI2.showUser(id1);
//        assertTrue(detail.isNotificationEnabled());
        try {
            user = twitter2.createFriendship(id2.screenName);
            fail("shouldn't be able to befrinend yourself");
        } catch (TwitterException te) {
            assertEquals(403, te.getStatusCode());
        }
        try {
            user = twitter2.createFriendship("doesnotexist--");
            fail("non-existing user");
        } catch (TwitterException te) {
            //now befriending with non-existing user returns 404
            //http://groups.google.com/group/twitter-development-talk/browse_thread/thread/bd2a912b181bc39f
            assertEquals(404, te.getStatusCode());
        }

    }

    public void testRelationship() throws Exception {
        //  TESTING PRECONDITIONS:
        //  1) id1 is followed by "followsOneWay", but not following "followsOneWay"
        Relationship rel1 = twitter1.showFriendship(id1.screenName, followsOneWay);
        assertNotNull(DataObjectFactory.getRawJSON(rel1));
        assertEquals(rel1, DataObjectFactory.createRelationship(DataObjectFactory.getRawJSON(rel1)));

        // test second precondition
        assertNotNull(rel1);
        assertTrue(rel1.isSourceFollowedByTarget());
        assertFalse(rel1.isSourceFollowingTarget());
        assertTrue(rel1.isTargetFollowingSource());
        assertFalse(rel1.isTargetFollowedBySource());
        assertTrue(rel1.canSourceDm());
        
        // reverse precondition
        Relationship rel1r = twitter1.showFriendship(followsOneWay, id1.screenName);
        assertNotNull(rel1r);
        assertFalse(rel1r.isSourceFollowedByTarget());
        assertTrue(rel1r.isSourceFollowingTarget());
        assertFalse(rel1r.isTargetFollowingSource());
        assertTrue(rel1r.isTargetFollowedBySource());
        assertFalse(rel1r.canSourceDm());

        //  2) best_friend1 is following and followed by best_friend2
        Relationship rel2 = twitter1.showFriendship(bestFriend1.screenName, bestFriend2.screenName);
        assertNull(DataObjectFactory.getRawJSON(rel1));
        assertNotNull(DataObjectFactory.getRawJSON(rel2));
        assertEquals(rel2, DataObjectFactory.createRelationship(DataObjectFactory.getRawJSON(rel2)));

        // test second precondition
        assertNotNull(rel2);
        assertTrue(rel2.isSourceFollowedByTarget());
        assertTrue(rel2.isSourceFollowingTarget());
        assertTrue(rel2.isTargetFollowingSource());
        assertTrue(rel2.isTargetFollowedBySource());

        // test equality
        Relationship rel3 = twitter1.showFriendship(id1.screenName, followsOneWay);
        assertNotNull(DataObjectFactory.getRawJSON(rel3));
        assertEquals(rel3, DataObjectFactory.createRelationship(DataObjectFactory.getRawJSON(rel3)));
        assertEquals(rel1, rel3);
        assertFalse(rel1.equals(rel2));

        ResponseList<Friendship> friendshipList = twitter1.lookupFriendships(new String[]{"barakobama", id2.screenName, id3.screenName});

        assertEquals(3, friendshipList.size());
        assertEquals("barakobama", friendshipList.get(0).getScreenName());
        assertFalse(friendshipList.get(0).isFollowing());
        assertFalse(friendshipList.get(0).isFollowedBy());
        assertEquals(id3.screenName, friendshipList.get(2).getScreenName());
        assertTrue(friendshipList.get(2).isFollowing());
        assertTrue(friendshipList.get(2).isFollowedBy());
        friendshipList = twitter1.lookupFriendships(new long[]{id2.id, id3.id});
        assertEquals(2, friendshipList.size());

        Relationship relationship = twitter1.updateFriendship(id3.screenName, true, true);
        assertEquals(id3.screenName, relationship.getTargetUserScreenName());

        Relationship updatedRelationship = twitter1.updateFriendship(id3.id, false, false);
        assertEquals(id3.screenName, updatedRelationship.getTargetUserScreenName());
        assertFalse(updatedRelationship.isSourceNotificationsEnabled());
        assertFalse(updatedRelationship.isSourceWantRetweets());
    }

    public void testLookupFriendships() throws Exception{
        // https://dev.twitter.com/discussions/13658
        //http://jira.twitter4j.org/browse/TFJ-746
        readonly.lookupUsers(new long[]{255794088L,441705930L,100581062L,49255734L,996328051L,559170296L,119261332L,373027695L,18515199L,83777877L,28973601L,228325562L,3474001L,297909405L,79159050L,94355673L,882514368L,97212832L,6459802L,124127525L,9121432L,57142748L,15797140L,985973888L,216250008L,121663344L,14832427L,54904048L,47539662L,22330739L,41032024L,24160034L,70614432L,489294299L,165725102L,203209274L,93831273L,49661959L,15670331L,30597967L,194643708L,70630881L,105973663L,114333005L,76407522L,5898822L,43796154L,5929112L,14118563L,64378588L,60287587L,28745562L,77718059L,106944925L,15744975L,81170234L,98512820L,20766533L,91238103L,15965719L,351559615L,5371072L,582489524L,367671660L,4037021L,52773639L,440662114L,14288985L,3868621L,13585812L,3811061L,14724896L,5491152L,4862261L,106114624L,459133564L,6609032L,4175171L,565734536L,174637883L,834785976L,338234111L,278590903L,205621126L,7362472L,329830408L,116640150L,52106559L,831322291L,53856691L,313143098L,563798434L,219589985L,5420012L,15142903L,107381955L,117652722L,188738873L,167628541L});
    }
    public void testIncomingOutgoingFriendships() throws Exception {
        IDs ids;
        ids = twitter3.getIncomingFriendships(-1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        assertEquals(ids, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(ids)));
        assertTrue(ids.getIDs().length > 0);
        ids = twitter2.getOutgoingFriendships(-1);
        assertNotNull(DataObjectFactory.getRawJSON(ids));
        assertEquals(ids, DataObjectFactory.createIDs(DataObjectFactory.getRawJSON(ids)));
        assertTrue(ids.getIDs().length > 0);
        // needs the account has at least one user who is not received any retweets.
        //assertTrue(ids.getIDs().length > 0);
    }

    public void testFriendsFollowersList() throws Exception {
        PagableResponseList<User> t4jfriends = twitter1.getFriendsList("t4j_news", -1L);
        PagableResponseList<User> t4jfriends2 = twitter1.getFriendsList(72297675L, -1L);
        assertEquals(t4jfriends, t4jfriends2);
        assertTrue(t4jfriends.size() > 0);

        PagableResponseList<User> t4jfollowers = twitter1.getFollowersList("t4j_news", -1L);
        PagableResponseList<User> t4jfollowers2 = twitter1.getFollowersList(72297675L, -1L);
        assertEquals(t4jfollowers, t4jfollowers2);
        assertTrue(t4jfollowers.size() > 0);
    }
}
