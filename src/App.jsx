import { Route, Routes } from 'react-router-dom'
import Header from './components/Header'
import AboutWe from './pages/AboutWe'
import Footer from './components/Footer'

function App() {

  return (
    <Routes>
      <Route path='/' element={<Header />} />
      <Route path='/ve-chung-toi' element={<AboutWe />} />
      <Route path='/FOOTER' element={<Footer />} />
    </Routes>

  )
}

export default App
