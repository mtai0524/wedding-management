// import axios from 'axios';

// const apiBaseUrl = 'https://localhost:7296'; // Địa chỉ cơ sở của API của bạn

// const getUserInfo = async (token) => {
//   try {
//     const response = await axios.get(`${apiBaseUrl}/api/account/GetUserInfo`, {
//       headers: {
//         Authorization: `Bearer ${token}`,
//       },
//     });

//     if (response.status === 200) {
//       return response.data; // Trả về thông tin người dùng
//     } else {
//       throw new Error('Lấy thông tin người dùng thất bại');
//     }
//   } catch (error) {
//     console.error('Lỗi:', error);
//     throw error;
//   }
// };

// export default getUserInfo;
