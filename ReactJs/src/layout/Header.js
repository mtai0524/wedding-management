import React, { useEffect, useState } from 'react'
import { Card, Spinner } from 'react-bootstrap';
import Apis, { endpoint } from '../configs/Apis';

export const Header = () => {
    const [menus, setMenus] = useState(null);
    const loadMenus = async () => {
        // let res =  await fetch("https://localhost:7121/api/ApiUser");
        // let res = await fetch("http://localhost:8080/WeddingRestaurant/api/users");
        // let data = await res.json();

        let res = await Apis.get(endpoint['menus']);

        setMenus(res.data);
    }
    useEffect(() => {
        loadMenus();
    }, [])
    if (menus === null) {
        return <Spinner animation="border" role="status">
            <span className="visually-hidden">Loading...</span>
        </Spinner>
    }
    const mystyle = {
        myButton: {
            backgroundColor: "#397B76",
            transition: "background-color 0.3s", // Thêm hiệu ứng chuyển đổi màu nền
            padding: "10px 20px",
            color: "#fff",
            border: "none",
            cursor: "pointer",
        },
        myButtonHover: {
            backgroundColor: "#2f605c", // Màu nền khi hover
        }
    }
    const handleMouseEnter = (e) => {
        e.target.style.backgroundColor = mystyle.myButtonHover.backgroundColor;
    };

    const handleMouseLeave = (e) => {
        e.target.style.backgroundColor = mystyle.myButton.backgroundColor;
    };
    return (
        <>
            <h1>header</h1>
            <div class="container">
                <div class="row">
                    {menus.map(menu => (
                        <Card key={menu.menuId} style={{ width: '18rem', margin: '20px' }}>
                            <Card.Img variant="top" src={menu.image} style={{ height: "190px" }} />
                            <Card.Body>
                                <Card.Title>{menu.name}</Card.Title>
                                <Card.Text>
                                   {menu.description}
                                </Card.Text>
                                <a href="#" className="btn btn-primary my-button" style={mystyle.myButton}
                                    onMouseEnter={handleMouseEnter}
                                    onMouseLeave={handleMouseLeave}>View Profile</a>
                            </Card.Body>
                        </Card>
                    ))}
                </div>
            </div>
        </>
    )
}
export default Header
