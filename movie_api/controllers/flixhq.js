const MOVIES = require("@consumet/extensions").MOVIES;
const flixhq = new MOVIES.FlixHQ();

async function search(req, res) {
  const { query } = req.params;
  try {
    const result = await flixhq.search(query);
    res.status(200).send(result);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}
async function getRecentMovies(req, res) {
  try {
    const recentMovies = await flixhq.fetchRecentMovies();
    res.status(200).send(recentMovies);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}
async function getRecentTvShows(req, res) {
  try {
    const recentTvShows = await flixhq.fetchRecentTvShows();
    res.status(200).send(recentTvShows);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}
async function getTrendingMovies(req, res) {
  try {
    const trendingMovies = await flixhq.fetchTrendingMovies();
    res.status(200).send(trendingMovies);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}
async function getTrendingTvShows(req, res) {
  try {
    const trendingTvShows = await flixhq.fetchTrendingTvShows();
    res.status(200).send(trendingTvShows);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}

async function getMediaInfo(req, res) {
  const { id } = req.params;
  try {
    const detail = await flixhq.fetchMediaInfo(id);
    res.status(200).send(detail);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}

async function getEpisodeSources(req, res) {
  const { episodeId, mediaId } = req.params;
  try {
    const detail = await flixhq.fetchEpisodeSources(episodeId, mediaId);
    res.status(200).send(detail);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}

async function getEpisodeServers(req, res) {
  const { episodeId, mediaId } = req.params;
  try {
    const detail = await flixhq.fetchEpisodeServers(episodeId, mediaId);
    res.status(200).send(detail);
  } catch (err) {
    res.status(500).json({ msg: "Internal Server Error" });
  }
}

exports.search = search;
exports.getRecentMovies = getRecentMovies;
exports.getRecentTvShows = getRecentTvShows;
exports.getTrendingMovies = getTrendingMovies;
exports.getTrendingTvShows = getTrendingTvShows;
exports.getMediaInfo = getMediaInfo;
exports.getEpisodeSources = getEpisodeSources;
exports.getEpisodeServers = getEpisodeServers;
