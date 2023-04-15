const config = require('../../src/config/config');
const axios = require('axios');

const getTrending = async () => {
    try {

        // https://app.swaggerhub.com/apis-docs/NexusMods/nexus-mods_public_api_params_in_form_data/1.0#/Mods/get_v1_games_game_domain_mods_trending.json
        let path = config.NEXUSMODS.BASE_URL + config.NEXUSMODS.API_VERSION + config.NEXUSMODS.ENDPOINTS.TRENDING;

        return new Promise((resolve, reject) => {
            axios.get(path, {
                headers: {
                    'apikey': process.env.NEXUSMODS_API_KEY
                }
            }).then((response : any) => {
                resolve(response.data);
            }).catch((error : any) => {
                reject(error);
            });
        });
    } catch (error) {
        console.log(error);
    }
};

const getLatestAdded = async () => {
    try {

        // https://app.swaggerhub.com/apis-docs/NexusMods/nexus-mods_public_api_params_in_form_data/1.0#/Mods/get_v1_games_game_domain_mods_latest_added.json
        let path = config.NEXUSMODS.BASE_URL + config.NEXUSMODS.API_VERSION + config.NEXUSMODS.ENDPOINTS.LATEST_ADDED;

        return new Promise((resolve, reject) => {
            axios.get(path, {
                headers: {
                    'apikey': process.env.NEXUSMODS_API_KEY
                }
            }).then((response : any) => {
                resolve(response.data);
            }).catch((error : any) => {
                reject(error);
            });
        });
    } catch (error) {
        console.log(error);
    }
};

const validateApiKey = async () => {
    try {

        // https://app.swaggerhub.com/apis-docs/NexusMods/nexus-mods_public_api_params_in_form_data/1.0#/User/post_v1_users_validate.json
        let path = config.NEXUSMODS.BASE_URL + config.NEXUSMODS.API_VERSION + config.NEXUSMODS.ENDPOINTS.VALIDATE_APIKEY;

        return new Promise((resolve, reject) => {
            axios.get(path, {
                headers: {
                    'apikey': process.env.NEXUSMODS_API_KEY
                }
            }).then((response : any) => {
                resolve(response.data);
            }).catch((error : any) => {
                reject(error);
            });
        });
    } catch (error) {
        console.log(error);
    }
};

module.exports = { getTrending, getLatestAdded, validateApiKey };
