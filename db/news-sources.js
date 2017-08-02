// News pages scoring to get a user's 'political source score'

// Constants for 4 categories of news source
var left = 1;
var c_left = 0.25;
var c_right = -0.25;
var right = -1;

// Hash of news sources
var news_sources = {};

// Left-wing news sources
news_sources["www.newyorker.com"] = left; // New Yorker
news_sources["www.theguardian.com"] = left; // The Guardian
news_sources["www.aljazeera.com"] = left; //Al Jazeera America
news_sources["huffingtonpost.com/section/politics"] = left; //HuffPost Politics
news_sources["www.vice.com"] = left; // Vice
news_sources[] = left; // Morning Star

// Centre left news sources
news_sources["www.bloomberg.com"] = c_left; //Bloomberg
news_sources["www.independent.co.uk"] = c_left; // Indepedent
news_sources["edition.cnn.com"] = c_left; // CNN
news_sources["www.nytimes.com"] = c_left; //New York Times
news_sources["www.nbcnews.com"] = c_left; // NBC News

// Centre right news sources
news_sources["www.wsj.com/europe"] = c_right; // Wall Street Journal
news_sources["www.telegraph.co.uk"] = c_right; // Telegraph
news_sources["www.thetimes.co.uk/?sunday"] = c_right; // Sunday Times
news_sources["www.economist.com"] = c_right; // The Economist

// Conservative news sources
news_sources["www.foxnews.com"] = right; // Fox News
news_sources["www.breitbart.com"] = right; // Breitbart
news_sources["www.infowars.com"] = right; // Info Wars
news_sources["www.dailymail.co.uk"] = right; // Daily Mail
news_sources["www.thesun.co.uk"] = right; // The Sun
news_sources["www.express.co.uk"] = right; // Express
news_sources["www.dailystar.co.uk"] = right; // The Star

