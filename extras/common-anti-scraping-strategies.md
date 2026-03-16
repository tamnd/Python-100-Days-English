## Common Anti-Crawling Strategies and Responses

Websites often defend themselves from crawlers. This note summarizes common techniques and corresponding responses.

Typical anti-crawling measures:

1. request-header checks
2. cookie validation
3. dynamic content rendering
4. rate limiting
5. hidden form fields
6. captchas
7. trap or honeypot links
8. IP and identity detection

Typical responses include:

- realistic request headers
- cookie handling
- Selenium or browser automation
- OCR or third-party captcha services
- proxy services
- throttling and politeness controls

The right response depends on the target site, but the broader lesson is that crawler engineering is often as much about protocol and behavior as it is about parsing HTML.
