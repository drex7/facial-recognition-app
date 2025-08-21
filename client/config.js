// API Configuration
const API_CONFIG = {
  // Default to current domain for containerized setup
  BASE_URL: window.location.origin,
  
  // API endpoints
  ENDPOINTS: {
    REGISTER: '/user/register',
    LOGIN: '/user/login', 
    LOGOUT: '/user/logout',
    DELETE_ACCOUNT: '/user/delete_account',
    USER_DETAILS: '/user/details',
    REFRESH_TOKEN: '/user/refresh_token',
    START_BACKEND: '/user/start-backend',
    STORE_BIOMETRIC: '/user/store_biometric_data',
    AUTHENTICATE_BIOMETRIC: '/user/authenticate_with_biometrics'
  }
};

// Helper function to build full API URL
function getApiUrl(endpoint) {
  const PORT = API_CONFIG.BASE_URL.includes('localhost') ? ':5000' : '';
  return API_CONFIG.BASE_URL + PORT + API_CONFIG.ENDPOINTS[endpoint] ;
}

// Export for use in other scripts
window.API_CONFIG = API_CONFIG;
window.getApiUrl = getApiUrl;