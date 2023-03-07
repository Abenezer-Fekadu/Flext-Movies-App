// Imports
const express = require("express");
const router = express.Router();

const {
  search,
  getRecentMovies,
  getRecentTvShows,
  getTrendingMovies,
  getTrendingTvShows,
  getMediaInfo,
  getEpisodeSources,
  getEpisodeServers,
} = require("../controllers/flixhq");

// Routes
router.get("/search/:query", search);
router.get("/getRecentMovies", getRecentMovies);
router.get("/getRecentMovies", getRecentMovies);
router.get("/getTrendingMovies", getTrendingMovies);
router.get("/getTrendingTvShows", getTrendingTvShows);
router.get("/getMediaInfo", getMediaInfo);
router.get("/getEpisodeSources/:episodeId", getEpisodeSources);
router.get("/getEpisodeServers/:episodeId", getEpisodeServers);

// Export
module.exports = router;
