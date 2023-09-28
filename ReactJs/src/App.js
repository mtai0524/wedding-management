import React from 'react'
import Header from './layout/Header'
import Footer from './layout/Footer'
import MenuForm from './components/MenuForm'
import SignUpForm from './components/SignUpForm'

export default function App() {
  return (
    <>
      {/* <Header/> */}
      <SignUpForm/>
      <div>App</div>
      <MenuForm/>
      <Footer/>
    </>
  )
}