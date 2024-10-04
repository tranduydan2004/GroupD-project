import { Link } from 'react-router-dom';

function Footer() {
    return (
        <footer className="bg-gray-100 text-gray-800 py-8 text-center w-full mt-auto">
            <div className="max-w-7xl mx-auto px-4 flex flex-col items-center md:flex-row md:justify-between container">
                <div className="flex flex-col items-center md:items-start">
                    <img src="/Koikoi.png" alt="My Image" className="w-[85px] h-[85px] mb-4" />
                    <p className="text-sm">Liên hệ Hotline: ...</p>
                </div>
                <div className="text-center md:text-left mt-4 md:mt-0">
                    <ul className="space-y-2">
                        <li><Link to="../pages/AboutWe.jsx" className="text-gray-600 hover:text-gray-900 transition duration-300">Về chúng tôi</Link></li>
                        <li><a href="" className="text-gray-600 hover:text-gray-900 transition duration-300">Giới thiệu</a></li>
                        <li><a href="" className="text-gray-600 hover:text-gray-900 transition duration-300">Lĩnh vực hoạt động</a></li>
                    </ul>
                </div>
                <div className="mt-4 md:mt-0 text-center md:text-right">
                    <span className="text-xs text-gray-500">© 2024 Công ty của bạn. Mọi quyền được bảo lưu.</span>
                </div>
            </div>
        </footer>
    )
}

export default Footer;