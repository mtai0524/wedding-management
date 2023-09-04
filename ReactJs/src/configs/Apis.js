import axios from 'axios'

const SERVER_CONTEXT = "/WeddingRestaurant";

export const endpoint = {
    // "users" : `${SERVER_CONTEXT}/api/users`
    "users" : "api/ApiUser"
}
export default axios.create({
    baseURL: "https://localhost:7121"
})