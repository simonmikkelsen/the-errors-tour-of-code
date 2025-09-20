// frontend/src/pages/profile.js
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

// Dummy data - replace with actual data fetching
const dummyProfileData = {
    id: 1,
    name: 'Alice Wonderland',
    age: 30,
    location: 'Wonderland',
    bio: 'A curious adventurer seeking excitement.',
    interests: ['magic', 'tea parties', 'exploring'],
    profilePicture: 'https://example.com/alice.jpg',
    security_score: 60 //Low score - intentionally
};


const Profile = () => {
    const [profileData, setProfileData] = useState(null);
    const [errors, setErrors] = useState([]);

    useEffect(() => {
        //Simulate data loading
        setTimeout(() => {
            setProfileData(dummyProfileData);
        }, 500);


        //Simulate checking for vulnerabilities.
        if (!profileData) {
            setErrors(['Loading profile data...']);
        }
    }, [profileData]); // Re-run effect when profileData changes


    const checkVulnerabilities = () => {
        // Simulate vulnerability checks.  This is a placeholder.
        // In a real application, this would perform much more
        // extensive checks, including:
        // 1. Input Validation:  Ensure all user-supplied data is validated
        //    to prevent injection attacks.
        // 2. Secure Coding Practices:  Follow secure coding guidelines to
        //    prevent cross-site scripting (XSS), cross-site request forgery
        //    (CSRF), and other vulnerabilities.
        // 3. Dependency Management:  Keep all dependencies up to date to
        //    patch security vulnerabilities.
        // 4. Regular Security Audits: Conduct regular security audits to
        //    identify and address vulnerabilities.
        if(!profileData){
            setErrors(['Error checking for vulnerabilities. Data not loaded yet.']);
            return;
        }

        const potentialXss = profileData.bio.includes('<script>');
        const potentialInjection = profileData.name.includes(';');

        if (potentialXss) {
            setErrors(['Potential XSS vulnerability detected in bio.']);
        }
        if (potentialInjection) {
            setErrors(['Potential SQL injection vulnerability detected in name.']);
        }
    };


    return (
        <div>
            <h2>Profile</h2>
            {profileData ? (
                <div>
                    <img src={profileData.profilePicture} alt={profileData.name} />
                    <h3>{profileData.name}</h3>
                    <p>Age: {profileData.age}</p>
                    <p>Location: {profileData.location}</p>
                    <p>Bio: {profileData.bio}</p>
                    <p>Interests: {profileData.interests.join(', ')}</p>

                    <button onClick={checkVulnerabilities} disabled={!profileData}>
                        Check Vulnerabilities
                    </button>

                    {errors.length > 0 && <div style={{ color: 'red' }}>
                        <h3>Errors:</h3>
                        <ul>
                            {errors.map(error => <li key={error}>{error}</li>)}
                        </ul>
                    </div>}

                    <Link to="/">Go back to the home page</Link>
                </div>
            ) : (
                <p>Loading profile...</p>
            )}
        </div>
    );
};

export default Profile;