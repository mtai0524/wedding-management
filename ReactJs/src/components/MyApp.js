import React, { useState, useEffect } from 'react';
import axios from 'axios';
import jwt_decode from 'jwt-decode';
import Cookies from 'js-cookie';

function UserInfo() {
  const [userInfo, setUserInfo] = useState(null);

  useEffect(() => {
    // Lấy token từ cookie
    const token = Cookies.get('token_user');
  
    if (token && !userInfo) {
      // Giải mã token để lấy thông tin email
      const decodedToken = jwt_decode(token);
      const email = decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'];
  
      // Gọi API để lấy thông tin người dùng dựa trên email
      axios.post('https://localhost:7296/api/account/GetUserInfo', email, {
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${token}`, // Thêm token vào tiêu đề
        },
      })
      .then((response) => {
        if (response.status === 200) {
          setUserInfo(response.data);
        } else {
          console.error('Lỗi khi lấy thông tin người dùng.');
        }
      })
      .catch((error) => {
        console.error('Lỗi khi gửi yêu cầu:', error);
      });
    }
  }, [userInfo]);
  

  return (
    <div>
      <h2>Thông tin người dùng</h2>
      {userInfo ? (
        <div>
          <h3>Email:</h3>
          <p>{userInfo.email}</p>
          <h3>FirstName:</h3>
          <p>{userInfo.firstName}</p>
          <h3>LastName:</h3>
          <p>{userInfo.lastName}</p>
          <h3>Avatar:</h3>
          <img src={userInfo.avatar} alt="Avatar" />
        </div>
      ) : (
        <p>Đang tải thông tin người dùng...</p>
      )}
    </div>
  );
}

export default UserInfo;
