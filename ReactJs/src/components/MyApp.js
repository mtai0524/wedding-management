// import React, { useState, useEffect } from 'react';
// import LoginForm from './LoginForm';
// import getUserInfo from './getUserInfo'; // Import hàm lấy thông tin người dùng

// const MyApp = () => {
//   const [token, setToken] = useState('');
//   const [userInfo, setUserInfo] = useState(null); // Trạng thái lưu thông tin người dùng

//   useEffect(() => {
//     const storedToken = localStorage.getItem('token');
//     if (storedToken) {
//       setToken(storedToken);

//       // Gọi hàm lấy thông tin người dùng khi token có sẵn
//       getUserInfo(storedToken)
//         .then((data) => {
//           setUserInfo(data); // Lưu thông tin người dùng vào trạng thái
//         })
//         .catch((error) => {
//           console.error('Lỗi khi lấy thông tin người dùng:', error);
//         });
//     }
//   }, []);

//   // Callback để xử lý đăng nhập thành công và lưu token
//   const handleLogin = (newToken) => {
//     setToken(newToken);
//     localStorage.setItem('token', newToken);
//   };

//   // Đăng xuất
//   const handleLogout = () => {
//     setToken('');
//     setUserInfo(null); // Xóa thông tin người dùng khi đăng xuất
//     localStorage.removeItem('token');
//   };

//   return (
//     <div>
//       {token ? (
//         <div>
//           <h2>Chào mừng {userInfo?.email}!</h2>
//           <button onClick={handleLogout}>Đăng xuất</button>
//         </div>
//       ) : (
//         <LoginForm onLogin={handleLogin} />
//       )}
//     </div>
//   );
// };

// export default MyApp;
