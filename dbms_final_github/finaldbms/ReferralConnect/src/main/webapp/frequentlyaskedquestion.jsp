<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>FAQs - ReferralConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f6f9fc;
            font-family: 'Segoe UI', sans-serif;
        }
        .faq-title {
            font-weight: 700;
            font-size: 2.5rem;
        }
        .faq-subtitle {
            color: #555;
        }
        .nav-tabs .nav-link.active {
            background-color: #ffffff !important;
            color: #0d6efd;
            border: none;
        }
        .nav-tabs .nav-link {
            color: #333;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="text-center mb-4">
        <h1 class="faq-title">Frequently Asked <span style="color:#0d6efd;">Questions</span></h1>
        <p class="faq-subtitle">If you have more questions, reach out to us at <a href="mailto:support@referralconnect.com">support@referralconnect.com</a></p>
    </div>

    <!-- Tabs -->
    <ul class="nav nav-tabs justify-content-center mb-4" id="faqTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="seekers-tab" data-bs-toggle="tab" data-bs-target="#seekers" type="button" role="tab">Reference Seekers</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="referrers-tab" data-bs-toggle="tab" data-bs-target="#referrers" type="button" role="tab">Referrers</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="privacy-tab" data-bs-toggle="tab" data-bs-target="#privacy" type="button" role="tab">Data and Privacy</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="general-tab" data-bs-toggle="tab" data-bs-target="#general" type="button" role="tab">General</button>
        </li>
    </ul>

    <!-- Tab Contents -->
    <div class="tab-content" id="faqTabContent">
        <div class="tab-pane fade show active" id="seekers" role="tabpanel">
            <div class="accordion" id="faqSeekers">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q1">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#a1" aria-expanded="true" aria-controls="a1">
                            How do I create a reference request?
                        </button>
                    </h2>
                    <div id="a1" class="accordion-collapse collapse show" aria-labelledby="q1" data-bs-parent="#faqSeekers">
                        <div class="accordion-body">
                            You can create a request by selecting a category, exploring institutions, and then choosing a referrer profile to submit your request.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a2" aria-expanded="false" aria-controls="a2">
                            How do I increase my chances of getting a referral?
                        </button>
                    </h2>
                    <div id="a2" class="accordion-collapse collapse" aria-labelledby="q2" data-bs-parent="#faqSeekers">
                        <div class="accordion-body">
                            Ensure your profile is fully updated—include your resume, achievements, goals, and a clear headline. Apply to relevant professionals, and personalize your application message if possible.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a3" aria-expanded="false" aria-controls="a3">
                            What kind of professionals can I reach out to?
                        </button>
                    </h2>
                    <div id="a3" class="accordion-collapse collapse" aria-labelledby="q3" data-bs-parent="#faqSeekers">
                        <div class="accordion-body">
                            You can connect with professionals across companies, universities, and research institutions who have opted in to offer referrals in categories like jobs, admissions, scholarships, and research.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q4">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a4" aria-expanded="false" aria-controls="a4">
                            Is there a limit to how many requests I can send?
                        </button>
                    </h2>
                    <div id="a4" class="accordion-collapse collapse" aria-labelledby="q4" data-bs-parent="#faqSeekers">
                        <div class="accordion-body">
                            Yes, to maintain quality and fairness, you can send a limited number of active referral requests at a time. This also helps referrers focus on serious candidates.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q5">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a5" aria-expanded="false" aria-controls="a5">
                            Can I withdraw a referral request?
                        </button>
                    </h2>
                    <div id="a5" class="accordion-collapse collapse" aria-labelledby="q5" data-bs-parent="#faqSeekers">
                        <div class="accordion-body">
                            Yes. You can cancel any pending request from your dashboard. This will free up a slot for a new application and remove your request from the referrer's view.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="q6">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#a6" aria-expanded="false" aria-controls="a6">
                            What happens after I'm referred?
                        </button>
                    </h2>
                    <div id="a6" class="accordion-collapse collapse" aria-labelledby="q6" data-bs-parent="#faqSeekers">
                        <div class="accordion-body">
                            Once a referrer submits your application internally or externally, you'll get a status update. After that, continue to follow up via the usual channels (e.g., company portal, email).
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="referrers" role="tabpanel">
            <div class="accordion" id="faqReferrers">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="rq1">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#ra1" aria-expanded="true" aria-controls="ra1">
                            What am I committing to by signing up as a referrer?
                        </button>
                    </h2>
                    <div id="ra1" class="accordion-collapse collapse show" aria-labelledby="rq1" data-bs-parent="#faqReferrers">
                        <div class="accordion-body">
                            You're offering an opportunity to review candidate profiles. You are not obligated to refer anyone. Only refer those who meet your criteria or company policies.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="rq2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ra2" aria-expanded="false" aria-controls="ra2">
                            Can I set limits on how many requests I receive?
                        </button>
                    </h2>
                    <div id="ra2" class="accordion-collapse collapse" aria-labelledby="rq2" data-bs-parent="#faqReferrers">
                        <div class="accordion-body">
                            Yes, you can set a monthly or weekly limit on how many requests you want to receive. Once that limit is reached, your profile won't be shown until it resets.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="rq3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ra3" aria-expanded="false" aria-controls="ra3">
                            How do I issue a referral?
                        </button>
                    </h2>
                    <div id="ra3" class="accordion-collapse collapse" aria-labelledby="rq3" data-bs-parent="#faqReferrers">
                        <div class="accordion-body">
                            ReferralConnect allows you to copy a candidate's details and submit them through your internal referral portal, or use our automated email generator if you prefer.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="rq4">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ra4" aria-expanded="false" aria-controls="ra4">
                            Will I receive compensation for referrals?
                        </button>
                    </h2>
                    <div id="ra4" class="accordion-collapse collapse" aria-labelledby="rq4" data-bs-parent="#faqReferrers">
                        <div class="accordion-body">
                            Some companies do offer bonuses for successful referrals, but that's outside ReferralConnect's control. Our platform does not provide direct payments or incentives.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="rq5">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ra5" aria-expanded="false" aria-controls="ra5">
                            Can I hide my profile temporarily?
                        </button>
                    </h2>
                    <div id="ra5" class="accordion-collapse collapse" aria-labelledby="rq5" data-bs-parent="#faqReferrers">
                        <div class="accordion-body">
                            Yes. If you're busy or unavailable, you can pause receiving new requests at any time from your dashboard.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="privacy" role="tabpanel">
            <div class="accordion" id="faqPrivacy">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="pq1">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#pa1" aria-expanded="true" aria-controls="pa1">
                            Is my personal information safe on ReferralConnect?
                        </button>
                    </h2>
                    <div id="pa1" class="accordion-collapse collapse show" aria-labelledby="pq1" data-bs-parent="#faqPrivacy">
                        <div class="accordion-body">
                            Yes. Your data is stored securely and only shared with users as per your selected visibility preferences. We follow industry-standard encryption protocols.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="pq2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#pa2" aria-expanded="false" aria-controls="pa2">
                            Who can view my profile?
                        </button>
                    </h2>
                    <div id="pa2" class="accordion-collapse collapse" aria-labelledby="pq2" data-bs-parent="#faqPrivacy">
                        <div class="accordion-body">
                            Only users relevant to your interest (referrers or seekers) can see your profile, and only after a connection request or application has been initiated.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="pq3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#pa3" aria-expanded="false" aria-controls="pa3">
                            Will my email or contact info be public?
                        </button>
                    </h2>
                    <div id="pa3" class="accordion-collapse collapse" aria-labelledby="pq3" data-bs-parent="#faqPrivacy">
                        <div class="accordion-body">
                            No. Contact information is never publicly displayed or shared without your explicit permission.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="pq4">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#pa4" aria-expanded="false" aria-controls="pa4">
                            Can I delete my account and data?
                        </button>
                    </h2>
                    <div id="pa4" class="accordion-collapse collapse" aria-labelledby="pq4" data-bs-parent="#faqPrivacy">
                        <div class="accordion-body">
                            Yes. You can request full data deletion from your account settings or by emailing our support team. This includes all your applications, messages, and profile information.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="pq5">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#pa5" aria-expanded="false" aria-controls="pa5">
                            Do you use cookies or tracking tools?
                        </button>
                    </h2>
                    <div id="pa5" class="accordion-collapse collapse" aria-labelledby="pq5" data-bs-parent="#faqPrivacy">
                        <div class="accordion-body">
                            We use minimal cookies to improve user experience and analytics. You can manage cookie preferences from your browser or account settings.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="general" role="tabpanel">
            <div class="accordion" id="faqGeneral">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="gq1">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#ga1" aria-expanded="true" aria-controls="ga1">
                            What is ReferralConnect?
                        </button>
                    </h2>
                    <div id="ga1" class="accordion-collapse collapse show" aria-labelledby="gq1" data-bs-parent="#faqGeneral">
                        <div class="accordion-body">
                            ReferralConnect is a platform that connects students and early-career professionals with verified referrers from companies, universities, and research groups to boost their application visibility.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="gq2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ga2" aria-expanded="false" aria-controls="ga2">
                            Is ReferralConnect free to use?
                        </button>
                    </h2>
                    <div id="ga2" class="accordion-collapse collapse" aria-labelledby="gq2" data-bs-parent="#faqGeneral">
                        <div class="accordion-body">
                            Yes, ReferralConnect is completely free for seekers and referrers. We aim to democratize access to career-building opportunities.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="gq3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ga3" aria-expanded="false" aria-controls="ga3">
                            Can I use ReferralConnect from any country?
                        </button>
                    </h2>
                    <div id="ga3" class="accordion-collapse collapse" aria-labelledby="gq3" data-bs-parent="#faqGeneral">
                        <div class="accordion-body">
                            Yes. Our platform is global. However, availability of referrers in certain regions or institutions may vary.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="gq4">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ga4" aria-expanded="false" aria-controls="ga4">
                            Do I need a resume to apply?
                        </button>
                    </h2>
                    <div id="ga4" class="accordion-collapse collapse" aria-labelledby="gq4" data-bs-parent="#faqGeneral">
                        <div class="accordion-body">
                            Yes, a resume is strongly recommended. It increases your chances of selection and helps referrers understand your background better.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="gq5">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#ga5" aria-expanded="false" aria-controls="ga5">
                            How is ReferralConnect different from LinkedIn?
                        </button>
                    </h2>
                    <div id="ga5" class="accordion-collapse collapse" aria-labelledby="gq5" data-bs-parent="#faqGeneral">
                        <div class="accordion-body">
                            Unlike LinkedIn, ReferralConnect is focused exclusively on referrals. You apply directly to individuals offering referrals, with automated tools to manage and track requests.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>