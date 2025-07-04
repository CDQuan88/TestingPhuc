import { BrowserRouter, Routes, Route } from "react-router-dom";
import "react-toastify/dist/ReactToastify.css";
import App from "../App";
import User from "../components/User/User";
import Admin from "../components/Admin/Admin";
import HomePage from "../components/Home/HomePage";
import ManageUser from "../components/Admin/Content/ManageUser";
import Dashboard from "../components/Admin/Content/Dashboard";
import Login from "../components/Auth/Login";
import Register from "../components/Auth/Register";
import { ToastContainer } from "react-toastify";
const Layout = (props) => {
  return (
    <>
      <Routes>
        <Route path="/" element={<App />}>
          <Route index element={<HomePage />} />
          <Route path="users" element={<User />} />
        </Route>

        <Route path="/admins" element={<Admin />}>
          <Route index element={<Dashboard />}></Route>
          <Route path="manage-user" element={<ManageUser />}></Route>
        </Route>

        <Route path="/login" element={<Login />}></Route>
        <Route path="/register" element={<Register />}></Route>
      </Routes>

      <ToastContainer
        position="top-right"
        autoClose={5000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick={false}
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light"
      />
    </>
  );
};

export default Layout;
