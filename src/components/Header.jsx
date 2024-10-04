import { useState, useEffect } from 'react';
import ArrowForwardOutlinedIcon from '@mui/icons-material/ArrowForwardOutlined';
import ArrowBackOutlinedIcon from '@mui/icons-material/ArrowBackOutlined';
import Footer from './Footer';

const images = [
    'https://img.pikbest.com/wp/202345/black-koi-an-orange-with-spots-is-swimming_9597133.jpg!w700wp',
    'https://img.pikbest.com/ai/illus_our/20230413/15b5af1879079a3ca60dafa14a540c05.jpg!w700wp',
    'https://img.pikbest.com/ai/illus_our/20230424/56e8da84cca313019c4d06456e4ee3a2.jpg!w700wp'
];

const Header = () => {
    const [currentIndex, setCurrentIndex] = useState(0);
    const nextSlide = () => {
        setCurrentIndex((prevIndex) => (prevIndex + 1) % images.length);
    };
    const prevSlide = () => {
        setCurrentIndex((prevIndex) => (prevIndex - 1 + images.length) % images.length);
    };
    useEffect(() => {
        const interval = setInterval(nextSlide, 3000);
        return () => clearInterval(interval);
    }, []);

    return (
        <>
            <div className="relative w-full h-screen">
                <img
                    src={images[currentIndex]}
                    alt={`Slide ${currentIndex}`}
                    style={{ width: '100%', maxWidth: '1530px', height: '700px', objectFit: 'cover' }}
                />

                {/* Header */}
                <header className="fixed top-0 left-0 w-full flex items-center justify-around p-4 bg-black bg-opacity-60 text-white z-50">
                    <div className="flex items-center space-x-6 justify-around">
                        <div className="">
                            <img src="/Koikoi.png" alt="My Image" className="w-[85px] h-[85px]" />

                        </div>
                        <nav className="hidden md:flex space-x-4">
                            <a href="#" className="flex items-center hover:text-gray-300">
                                Trang chủ
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                                </svg>
                            </a>
                            <a href="#" className="flex items-center hover:text-gray-300">
                                Thông tin hồ cá Koi
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                                </svg>
                            </a>
                            <a href="#" className="flex items-center hover:text-gray-300">
                                Thông tin cá Koi
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                                </svg>
                            </a>
                            <a href="#" className="flex items-center hover:text-gray-300">
                                Nhắc nhở
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                                </svg>
                            </a>
                            <a href="#" className="flex items-center hover:text-gray-300">
                                Nhật kí dùng ao
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-4 w-4 ml-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 9l-7 7-7-7" />
                                </svg>
                            </a>
                        </nav>
                    </div>
                    <div className="flex items-center space-x-6">
                        <div className="cursor-pointer">
                            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6 hover:text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 20a8 8 0 110-16 8 8 0 010 16zm4.66-4.66l4.34 4.34" />
                            </svg>
                        </div>
                        <div className="relative cursor-pointer">
                            <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6 hover:text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V4a2 2 0 10-4 0v1.341C8.67 7.165 8 9.03 8 11v3.159c0 .538-.214 1.055-.595 1.436L6 17h5m4 0v1a3 3 0 11-6 0v-1m6 0H9" />
                            </svg>
                            <span className="absolute top-0 right-0 block h-5 w-5 rounded-full bg-red-600 text-white text-xs text-center">15</span>
                        </div>
                        <div className="cursor-pointer">
                            <svg xmlns="http://www.w3.org/2000/svg" className="h-8 w-8 hover:text-gray-300" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M10 12a5 5 0 100-10 5 5 0 000 10zm-7 8a7 7 0 0114 0H3z" />
                            </svg>
                        </div>
                    </div>
                </header>
                <button
                    onClick={prevSlide}
                    className="absolute top-1/2 left-8 transform -translate-y-1/2 text-white bg-black bg-opacity-50 p-2 rounded-full hover:bg-opacity-75"
                >
                    <ArrowBackOutlinedIcon size={24} />
                </button>
                <button
                    onClick={nextSlide}
                    className="absolute top-1/2 right-8 transform -translate-y-1/2 text-white bg-black bg-opacity-50 p-2 rounded-full hover:bg-opacity-75"
                >
                    <ArrowForwardOutlinedIcon size={24} />
                </button>
                <div className="absolute left-12 bottom-1/3 space-x-4 z-10">
                    <button className="px-6 py-2 bg-red-600 text-white text-lg font-bold rounded hover:bg-red-700 transition">
                        Xem thông tin cá Koi
                    </button>
                </div>
            </div>
            <Footer />
        </>

    );
};

export default Header;
