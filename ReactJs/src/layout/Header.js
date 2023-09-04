import React, { useEffect, useState } from 'react'
import { Card, Spinner } from 'react-bootstrap';
import Apis, { endpoint } from '../configs/Apis';

export const Header = () => {
    const [users, setUsers] = useState(null);
    const loadUsers = async () => {
        // let res =  await fetch("https://localhost:7121/api/ApiUser");
        // let res = await fetch("http://localhost:8080/WeddingRestaurant/api/users");
        // let data = await res.json();

        let res = await Apis.get(endpoint['users']);

        setUsers(res.data);
    }
    useEffect(() => {
        loadUsers();
    }, [])
    if (users === null) {
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
                    {users.map(user => (
                        <Card key={user.userId} style={{ width: '18rem', margin: '20px' }}>
                            <Card.Img variant="top" src={user.avatar} style={{ height: "190px" }} />
                            <Card.Body>
                                <Card.Title>{user.name}</Card.Title>
                                <Card.Text>
                                    Role: {user.role}
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
