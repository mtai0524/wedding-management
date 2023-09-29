import React, { useState, useEffect } from 'react';
import Cookies from 'js-cookie';

function SecureComponent() {
  const [data, setData] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      const token = Cookies.get('token_user');
      if (!token) {
        // Xử lý khi không có token, có thể đưa người dùng đến trang đăng nhập
        return;
      }

      try {
        const response = await fetch('https://localhost:7296/api/SecureData/secure-data', {
          method: 'GET',
          headers: {
            Authorization: `Bearer ${token}`, // Gửi token trong tiêu đề
          },
        });

        if (response.ok) {
          const responseData = await response.json();
          setData(responseData);
        } else {
          // Xử lý khi yêu cầu thất bại hoặc token không hợp lệ
        }
      } catch (error) {
        // Xử lý khi xảy ra lỗi kết nối
      }
    };

    fetchData();
  }, []);

  return (
    <div>
      <h2>Dữ liệu bảo mật</h2>
      {data ? (
        <div>
          {/* Hiển thị dữ liệu bảo mật ở đây */}
        </div>
      ) : (
        <p>Đang tải...</p>
      )}
    </div>
  );
}

export default SecureComponent;
