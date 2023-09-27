import React, { useEffect, useState } from 'react';
import { Card, Spinner } from 'react-bootstrap';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

function MenuForm() {
  const [menuData, setMenuData] = useState({
    name: '',
    price: '',
    description: '',
    categoryId: '',
  });

  const [menus, setMenus] = useState([]);
  const [loading, setLoading] = useState(true);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setMenuData({ ...menuData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('https://localhost:7296/api/menu', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(menuData),
      });

      if (response.ok) {
        console.log('Dữ liệu đã được gửi thành công.');

        // Hiển thị toast thông báo thành công
        toast.success('Thêm món ăn thành công!', {
          position: 'top-right',
          autoClose: 3000, // Thời gian hiển thị toast (3 giây)
          hideProgressBar: false,
          closeOnClick: true,
          pauseOnHover: true,
          draggable: true,
        });

        // Lấy danh sách món ăn từ API sau khi thêm mới
        const updatedMenusResponse = await fetch('https://localhost:7296/api/menu');
        if (updatedMenusResponse.ok) {
          const updatedMenusData = await updatedMenusResponse.json();
          setMenus(updatedMenusData);
        }
        
        // Xóa dữ liệu trong form sau khi thêm
        setMenuData({
          name: '',
          price: '',
          description: '',
          categoryId: '',
        });
      } else {
        console.error('Lỗi khi gửi dữ liệu.');
        // Xử lý khi gửi dữ liệu thất bại
      }
    } catch (error) {
      console.error('Lỗi khi gửi dữ liệu:', error);
      // Xử lý khi xảy ra lỗi
    }
  };

  useEffect(() => {
    // Lấy danh sách món ăn ban đầu khi trang được tải
    const fetchMenus = async () => {
      try {
        const response = await fetch('https://localhost:7296/api/menu');
        if (response.ok) {
          const data = await response.json();
          setMenus(data);
          setLoading(false);
        }
      } catch (error) {
        console.error('Lỗi khi lấy danh sách món ăn:', error);
        setLoading(false);
      }
    };

    fetchMenus();
  }, []);

  if (loading) {
    return (
      <Spinner animation="border" role="status">
        <span className="visually-hidden">Loading...</span>
      </Spinner>
    );
  }

  return (
    <div>
      <h1>Menu Form</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="name">Tên món ăn:</label>
          <input
            type="text"
            id="name"
            name="name"
            value={menuData.name}
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="price">Giá:</label>
          <input
            type="number"
            id="price"
            name="price"
            value={menuData.price}
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="description">Mô tả:</label>
          <textarea
            id="description"
            name="description"
            value={menuData.description}
            onChange={handleChange}
          />
        </div>
        <div>
          <label htmlFor="categoryId">Danh mục:</label>
          <input
            type="text"
            id="categoryId"
            name="categoryId"
            value={menuData.categoryId}
            onChange={handleChange}
          />
        </div>
        <button type="submit">Lưu</button>
      </form>
      <div className="container">
        <div className="row">
          {menus.map((menu) => (
            <Card key={menu.menuId} style={{ width: '18rem', margin: '20px' }}>
              <Card.Img variant="top" src={menu.image} style={{ height: '190px' }} />
              <Card.Body>
                <Card.Title>{menu.name}</Card.Title>
                <Card.Text>{menu.description}</Card.Text>
                <a href="#" className="btn btn-primary">
                  View Profile
                </a>
              </Card.Body>
            </Card>
          ))}
        </div>
      </div>
    </div>
  );
}

export default MenuForm;
