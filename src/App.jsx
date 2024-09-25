import { Outlet, Routes } from 'react-router-dom'
import Header from './components/header'
import Footer from './components/Footer'

function App() {

  return (
    <Routes>
      <Header />
      <Footer />
      <Outlet />
    </Routes>
  )
}

export default App
