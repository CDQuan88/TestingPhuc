import "./Register.scss";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import { postRegister } from "../services/apiService";
const Register = (props) => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [username, setUsername] = useState("");
  const navigate = useNavigate();

  const validateEmail = (email) => {
    return String(email)
      .toLowerCase()
      .match(
        /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      );
  };

  const handleRegister = async () => {
    if (!validateEmail(email)) {
      toast.error("Email is not valid");
      return;
    }
    if (!password.trim()) {
      toast.error("Password is required");
      return;
    }
    if (!username.trim()) {
      toast.error("Username is required");
      return;
    }
    let data = await postRegister(email, username, password);
    if (data && +data.EC === 0) {
      toast.success(data.EM);
      navigate("/login");
    }
    if (data && +data.EC !== 0) {
      toast.error(data.EM);
    }
  };
  return (
    <div className="register-container">
      <div className="header">
        <span>Already have an account?</span>
        <button className="btn-login" onClick={() => navigate("/login")}>
          Log in
        </button>
      </div>
      <div className="title col-4 mx-auto">Hoi dan IT &amp; Eric</div>
      <div className="welcome col-4 mx-auto">Start your journey with us</div>
      <div className="content-form col-4 mx-auto">
        <div className="form-group">
          <label>Email (*)</label>
          <input
            type="email"
            className="form-control"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
        <div className="form-group">
          <label>Password (*)</label>
          <input
            type="password"
            className="form-control"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </div>
        <div className="form-group">
          <label>Username (*)</label>
          <input
            type="text"
            className="form-control"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </div>
        <div>
          <button className="btn-submit" onClick={() => handleRegister()}>
            Create my free account
          </button>
        </div>
        <div className="text-center">
          <span className="back" onClick={() => navigate("/")}>
            &#60;&#60; Back to Homepage
          </span>
        </div>
      </div>
    </div>
  );
};

export default Register;
