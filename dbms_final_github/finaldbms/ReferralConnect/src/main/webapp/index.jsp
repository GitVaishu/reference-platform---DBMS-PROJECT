<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Referral Connect | Professional Networking Platform</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --primary-light: #4895ef;
            --secondary-color: #3a0ca3;
            --accent-color: #f72585;
            --dark-color: #2b2d42;
            --light-color: #f8f9fa;
            --text-color: #333;
            --text-light: #6c757d;
        }
        
        html {
            scroll-behavior: smooth;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            line-height: 1.6;
            overflow-x: hidden;
        }
        
        h1, h2, h3, h4, h5 {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
        }
        
        /* Navigation */
        .navbar {
            padding: 15px 5%;
            background-color: white;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        
        .navbar-brand {
            font-size: 26px;
            font-weight: 700;
            color: var(--secondary-color) !important;
        }
        
        .nav-link {
            font-weight: 500;
            margin: 0 10px;
            color: var(--dark-color) !important;
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            color: var(--primary-color) !important;
        }
        
        .btn-nav {
            padding: 8px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        /* Hero Section */
        .hero {
            padding: 120px 0;
            background: linear-gradient(135deg, rgba(248,249,250,1) 0%, rgba(232,240,254,1) 100%);
            position: relative;
            overflow: hidden;
        }
        
        .hero::before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 300px;
            height: 300px;
            background-color: rgba(72, 149, 239, 0.1);
            border-radius: 50%;
            z-index: 1;
        }
        
        .hero::after {
            content: '';
            position: absolute;
            bottom: -100px;
            left: -100px;
            width: 400px;
            height: 400px;
            background-color: rgba(247, 37, 133, 0.1);
            border-radius: 50%;
            z-index: 1;
        }
        
        .hero-content {
            position: relative;
            z-index: 2;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            color: var(--secondary-color);
            line-height: 1.2;
        }
        
        .hero p {
            font-size: 1.25rem;
            max-width: 600px;
            margin: 0 auto 2.5rem;
            color: var(--text-light);
        }
        
        /* Button Styles */
        .btn-custom {
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-primary-custom {
            background-color: var(--primary-color);
            color: white;
            border: 2px solid var(--primary-color);
        }
        
        .btn-primary-custom:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(58, 12, 163, 0.2);
        }
        
        .btn-accent-custom {
            background-color: var(--accent-color);
            color: white;
            border: 2px solid var(--accent-color);
        }
        
        .btn-accent-custom:hover {
            background-color: #d91a6d;
            border-color: #d91a6d;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(247, 37, 133, 0.2);
        }
        
        .btn-outline-custom {
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }
        
        .btn-outline-custom:hover {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(67, 97, 238, 0.2);
        }
        
        /* Section Titles */
        .section-title {
            position: relative;
            margin-bottom: 3rem;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 4px;
            background: var(--primary-color);
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }
        
        /* Feature Cards */
        .feature-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            height: 100%;
            box-shadow: 0 5px 30px rgba(0,0,0,0.08);
            transition: all 0.4s ease;
            border: none;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
            z-index: 2;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.15);
        }
        
        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .feature-card:hover .feature-icon {
            color: var(--accent-color);
            transform: scale(1.1);
        }
        
        .feature-card h3 {
            margin-bottom: 1rem;
            color: var(--dark-color);
        }
        
        .feature-card p {
            color: var(--text-light);
        }
        
        /* How It Works Section */
        .how-it-works {
            background: linear-gradient(135deg, rgba(248,249,250,1) 0%, rgba(232,240,254,1) 100%);
        }
        
        .step-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            height: 100%;
            border-left: 4px solid var(--primary-color);
        }
        
        .step-number {
            display: inline-block;
            width: 40px;
            height: 40px;
            background: var(--primary-color);
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            font-weight: 600;
            margin-bottom: 15px;
        }
        
        /* Testimonials */
        .testimonial-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            height: 100%;
            position: relative;
        }
        
        .testimonial-card::before {
            content: '\201C';
            font-family: 'Playfair Display', serif;
            font-size: 5rem;
            color: rgba(67, 97, 238, 0.1);
            position: absolute;
            top: 10px;
            left: 20px;
            line-height: 1;
        }
        
        .testimonial-text {
            font-style: italic;
            color: var(--text-color);
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
        }
        
        .testimonial-author {
            font-weight: 600;
            color: var(--dark-color);
        }
        
        .testimonial-role {
            color: var(--text-light);
            font-size: 0.9rem;
        }
        
        /* CTA Section */
        .cta-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            position: relative;
            overflow: hidden;
        }
        
        .cta-section::before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background-color: rgba(255,255,255,0.1);
            border-radius: 50%;
        }
        
        .cta-section::after {
            content: '';
            position: absolute;
            bottom: -100px;
            left: -100px;
            width: 300px;
            height: 300px;
            background-color: rgba(255,255,255,0.1);
            border-radius: 50%;
        }
        
        .cta-content {
            position: relative;
            z-index: 2;
        }
        
        /* Footer */
        footer {
            background-color: var(--dark-color);
            color: white;
            padding: 60px 0 30px;
        }
        
        .footer-links h5 {
            color: white;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-links h5::after {
            content: '';
            position: absolute;
            width: 40px;
            height: 2px;
            background: var(--primary-color);
            bottom: 0;
            left: 0;
        }
        
        .footer-links ul {
            list-style: none;
            padding: 0;
        }
        
        .footer-links li {
            margin-bottom: 10px;
        }
        
        .footer-links a {
            color: rgba(255,255,255,0.7);
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .footer-links a:hover {
            color: white;
            padding-left: 5px;
        }
        
        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.1);
            color: white;
            border-radius: 50%;
            margin-right: 10px;
            transition: all 0.3s ease;
        }
        
        .social-icons a:hover {
            background: var(--primary-color);
            transform: translateY(-3px);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .hero h1 {
                font-size: 2.8rem;
            }
        }
        
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.2rem;
            }
            
            .hero p {
                font-size: 1.1rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#home">
                <i class="fas fa-handshake me-2"></i>Referral Connect
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-lg-center">
                    <li class="nav-item">
                        <a class="nav-link active" href="#home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#how-it-works">How It Works</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#testimonials">Testimonials</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-custom btn-nav ms-lg-3" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section (Home) -->
    <section class="hero" id="home">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 hero-content">
                    <h1>Unlock Opportunities Through Professional Connections</h1>
                    <p>Bridge the gap between ambition and achievement with personalized referrals from industry professionals.</p>
                    <div class="d-flex flex-wrap">
                        <a href="registerStudent.jsp" class="btn btn-primary-custom btn-custom me-3 mb-3">Register as Student</a>
                        <a href="registerProfessional.jsp" class="btn btn-outline-custom btn-custom mb-3">Register as Professional</a>
                    </div>
                </div>
                <div class="col-lg-6 d-none d-lg-block">
                    <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80" alt="Professional Networking" class="img-fluid rounded-3 shadow-lg">
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5" id="features">
        <div class="container py-5">
            <h2 class="text-center section-title">What Referrals Can You Request?</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-briefcase"></i>
                        </div>
                        <h3>Job Referrals</h3>
                        <p>Get referred to top companies and land interviews at your dream workplaces through our professional network.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <h3>University Admissions</h3>
                        <p>Connect with alumni who can provide recommendations and guidance for your academic applications.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-trophy"></i>
                        </div>
                        <h3>Scholarships</h3>
                        <p>Find professionals who can endorse you for competitive scholarship programs and funding opportunities.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="fas fa-user-tie"></i>
                        </div>
                        <h3>Mentorship</h3>
                        <p>Build relationships with experienced professionals who can guide your career development.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works py-5" id="how-it-works">
        <div class="container py-5">
            <h2 class="text-center section-title">How It Works</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="step-card">
                        <div class="step-number">1</div>
                        <h3>Create Your Profile</h3>
                        <p>Students showcase their achievements and goals. Professionals highlight their expertise and availability.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="step-card">
                        <div class="step-number">2</div>
                        <h3>Find Connections</h3>
                        <p>Discover and connect with the right professionals or talented students in your field.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="step-card">
                        <div class="step-number">3</div>
                        <h3>Request Referrals</h3>
                        <p>Easily send and manage referral requests through our streamlined platform.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="py-5" id="testimonials">
        <div class="container py-5">
            <h2 class="text-center section-title">Success Stories</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <p class="testimonial-text">"Referral Connect helped me secure three interviews at top tech companies through professional referrals. I landed my dream job at Google!"</p>
                        <div class="d-flex align-items-center">
                            <img src="https://img.freepik.com/premium-photo/headshot-photos-indian-women-dynamic-professions-occassions-indian-girl_978786-295.jpg" alt="Nihita Kale" class="rounded-circle me-3" width="50">
                            <div>
                                <p class="testimonial-author mb-0">Nihita Kale</p>
                                <p class="testimonial-role">Software Engineer</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <p class="testimonial-text">"As a professional, I enjoy mentoring students through this platform. It's rewarding to help the next generation succeed in their careers."</p>
                        <div class="d-flex align-items-center">
                            <img src="https://img.freepik.com/premium-photo/indian-business-women_714173-5405.jpg" alt="Dr. Sneha Thombare" class="rounded-circle me-3" width="50">
                            <div>
                                <p class="testimonial-author mb-0">Dr. Sneha Thombare</p>
                                <p class="testimonial-role">Senior Data Scientist</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <p class="testimonial-text">"The scholarship referral I received through this platform completely changed my academic journey. Forever grateful for this community!"</p>
                        <div class="d-flex align-items-center">
                            <img src="https://as1.ftcdn.net/v2/jpg/06/36/69/86/1000_F_636698674_DroChEj5eWmZiaZOSDMnj8hcDqqw74Fp.jpg" class="rounded-circle me-3" width="50">
                            <div>
                                <p class="testimonial-author mb-0">Prajakta Patil</p>
                                <p class="testimonial-role">TY Btech Student</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section py-5">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center cta-content">
                    <h2 class="mb-4">Ready to Transform Your Career?</h2>
                    <p class="mb-5">Join thousands of students and professionals who are already benefiting from meaningful connections.</p>
                    <div class="d-flex justify-content-center flex-wrap">
                        <a href="registerStudent.jsp" class="btn btn-light btn-custom mx-3 mb-3">Join as Student</a>
                        <a href="registerProfessional.jsp" class="btn btn-outline-light btn-custom mx-3 mb-3">Join as Professional</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-5 mb-lg-0">
                    <h5><i class="fas fa-handshake me-2"></i>Referral Connect</h5>
                    <p class="mt-3">Connecting students with professionals for recommendations that matter.</p>
                    <div class="social-icons mt-4">
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-md-4 col-lg-2 mb-4 mb-md-0">
                    <h5>Quick Links</h5>
                    <ul class="footer-links mt-3">
                        <li><a href="#home">Home</a></li>
                        <li><a href="#features">Features</a></li>
                        <li><a href="#how-it-works">How It Works</a></li>
                        <li><a href="#testimonials">Testimonials</a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-lg-3 mb-4 mb-md-0">
                    <h5>Resources</h5>
                    <ul class="footer-links mt-3">
                        <li><a href="frequentlyaskedquestion.jsp">FAQ</a></li>
                        <li><a href="#">Career Tips</a></li>
                        <li><a href="#">Success Stories</a></li>
                    </ul>
                </div>
                <div class="col-md-4 col-lg-3">
                    <h5>Contact Us</h5>
                    <ul class="footer-links mt-3">
                        <li><i class="fas fa-envelope me-2"></i> referralconnect@referralconnect.com</li>
                        <li><i class="fas fa-phone me-2"></i> +91 9511792224</li>
                        <li><i class="fas fa-map-marker-alt me-2"></i> Cummins College Rd, Karvenagar, Pune, Maharashtra 411052 </li>
                    </ul>
                </div>
            </div>
            </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>