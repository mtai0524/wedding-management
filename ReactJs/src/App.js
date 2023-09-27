import React from 'react'
import Header from './layout/Header'
import Footer from './layout/Footer'
import MenuForm from './components/MenuForm'

export default function App() {
  return (
    <>
      <Header/>
      <div>App</div>
      <MenuForm/>
      <Footer/>
    </>
  )
}