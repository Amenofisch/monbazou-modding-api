const slowDown = require("express-slow-down");

// Rate limits
const defaultRateLimit = slowDown({
    windowMs: 60 * 1000,
    delayAfter: 30,
    delayMs: 250,
    maxDelayMs: 5 * 1000
});

export default { defaultRateLimit };