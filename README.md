# Russian Troll Tweets Pre & Post-2016 Election

This plot visualizes the number of Pro-Trump tweets released per day by the Internet Research Agency, a known Russian “troll factory,” before and after the 2016 Presidential Election. The results show distinct spikes in the two months leading up to the election, and minimal activity after the election.

## Plot Description

This graph suggests accounts controlled by the Internet Research Agency tweeted content in English during the weeks leading up to the Presidential Election in general support of then-candidate Trump. In particular, we see significant spikes surrounding prominent events that affected the Trump Campaign.

This includes a rise in mid-September when Reuters released a [poll](https://www.reuters.com/article/us-usa-election-poll-idUSKCN11M2A4) showing Clinton and Trump neck-and-neck for the electoral college. This also includes a spike when the editorial board of the USA Today [broke their 34-year precedent](https://www.usatoday.com/story/opinion/2016/09/29/dont-vote-for-donald-trump-editorial-board-editorials-debates/91295020/) of not taking a side in a presidential race by declaring Mr. Trump “unfit for the presidency.” Lastly, this includes a significant spike on October 7th, 2016 when the [Access Hollywood tape](https://www.washingtonpost.com/politics/trump-recorded-having-extremely-lewd-conversation-about-women-in-2005/2016/10/07/3b9ce776-8cb4-11e6-bf8a-3d26847eeed4_story.html) was released and when WikiLeaks, just thirty minutes after said tape was released, [began publishing thousands of Clinton campaign emails](https://www.nytimes.com/2016/10/08/us/politics/us-formally-accuses-russia-of-stealing-dnc-emails.html?searchResultPosition=2) from John Podesta’s email account.

Given the steep decline in tweets after the election, these results suggest an effort amongst this Russian-controlled organization to support President Trump during the election. It is worthwhile to note that the Internet Research Agency, as a part of special counsel Robert Mueller’s Russia investigation, were a defendant in an indictment filed by the Justice Department in February 2018.

## Data Source

The data for this analysis and visualization comes from FiveThirtyEight, a private polling aggregation site. According to their [documentation](https://github.com/fivethirtyeight/russian-troll-tweets/blob/master/README.md):

> FiveThirtyEight obtained the data from Clemson University researchers [Darren Linvill](https://www.clemson.edu/cbshs/faculty-staff/profiles/darrenl), an associate professor of communication, and [Patrick Warren](http://pwarren.people.clemson.edu/), an associate professor of economics, on July 25, 2018. They gathered the data using custom searches on a tool called Social Studio, owned by Salesforce and contracted for use by Clemson's [Social Media Listening Center](https://www.clemson.edu/cbshs/centers-institutes/smlc/).

> The basis for the Twitter handles included in this data are the [November 2017](https://democrats-intelligence.house.gov/uploadedfiles/exhibit_b.pdf) and [June 2018](https://democrats-intelligence.house.gov/uploadedfiles/ira_handles_june_2018.pdf) lists of Internet Research Agency-connected handles that Twitter [provided](https://democrats-intelligence.house.gov/news/documentsingle.aspx?DocumentID=396) to Congress. This data set contains every tweet sent from each of the 2,752 handles on the November 2017 list since May 10, 2015. For the 946 handles newly added on the June 2018 list, this data contains every tweet since June 19, 2015. (For certain handles, the data extends even earlier than these ranges. Some of the listed handles did not tweet during these ranges.) The researchers believe that this includes the overwhelming majority of these handles’ activity. The researchers also removed 19 handles that remained on the June 2018 list but that they deemed very unlikely to be IRA trolls.

The data can be found [here](https://data.fivethirtyeight.com/) under the `russian-troll-tweets` category, or specifically in this [GitHub repository](https://github.com/fivethirtyeight/russian-troll-tweets).

This data comes in the form of thirteen separate CSV files. For the purposes of this analysis, only three were used. Each file has the same columns, so a simple row bind will place them all in a single data frame.

This resulted in about 750,000 tweets from known Russian troll accounts controlled by the Internet Research Agency. I specifically chosen to illuminate only tweets published in English by accounts that were classified as RightTroll accounts by the researchers.

In order to determine if the tweet contained Pro-Trump content, I searched for the following phrases and hashtags in each of the tweets. Any tweet containing at least one of the phrases below is considered Pro-Trump.

- America First
- Build the Wall
- Crooked Hillary
- Fake News
- Fake News Media
- Hillary for Prison
- Left Media Content
- Leftist Media Content
- Lock Her Up
- MAGA
- Make America Great Again

I then plot the count of the number of Pro-Trump tweets per day, along a time scale axis.
