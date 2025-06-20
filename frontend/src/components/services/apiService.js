import axios from "../utils/axiosCustomize";
axios.defaults.timeout = 5000;

const postCreateNewUser = (email, password, username, role, image) => {
  //submit form
  const data = new FormData();
  data.append("email", email);
  data.append("password", password);
  data.append("username", username);
  data.append("role", role);
  data.append("userImage", image);

  return axios.post("api/v1/participant", data);
};

const getAllUsers = () => {
  return axios.get("api/v1/participant/all");
};

const getUserWithPaginate = (page, limit) => {
  return axios.get(`api/v1/participant?page=${page}&limit=${limit}`);
};

const putUpdateUser = (id, username, role, image) => {
  const data = new FormData();
  data.append("id", id);
  data.append("username", username);
  data.append("role", role);
  data.append("userImage", image);
  return axios.put(`api/v1/participant`, data);
};

const deleteUser = (userId) => {
  return axios.delete(`api/v1/participant`, { data: { id: userId } });
};

const postLogin = (email, password) => {
  return axios.post("/api/v1/login", { email, password, delay: 3000 });
};
const postRegister = (email, username, password) => {
  return axios.post("api/v1/register", { email, username, password });
};
export {
  postCreateNewUser,
  getAllUsers,
  getUserWithPaginate,
  putUpdateUser,
  deleteUser,
  postLogin,
  postRegister,
};
