import axios from 'axios'

const SERVER_CONTEXT = "/WeatherForecast";

export const endpoint = {
    // "users" : `${SERVER_CONTEXT}/api/users`
    "menus" : "api/menu"
}
export default axios.create({
    baseURL: "https://localhost:7296"
})