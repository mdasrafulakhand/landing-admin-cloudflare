# Landing Page + Admin Panel (Cloudflare Pages + Functions + D1)

এই প্রজেক্টে আছে:
- Public landing page
- `/admin/` admin UI
- Pages Function API
- D1 content store এবং basic event analytics

## 1. আগে ফাইলের ব্যাকআপ রাখুন
আপনার আগের `index.html`-এর কপি রাখুন। এই ZIP-টি আলাদা ফোল্ডারে extract করুন।

## 2. Cloudflare-এ D1 database তৈরি
1. Cloudflare Dashboard → Storage & databases → D1 SQL Database → Create database.
2. নাম দিন `vellora-content`.
3. database ID কপি করে `wrangler.toml`-এর `REPLACE_WITH_YOUR_D1_DATABASE_ID`-এর জায়গায় বসান।
4. D1 Console-এ `schema.sql`-এর সম্পূর্ণ SQL চালান।

## 3. Project deploy
Cloudflare Dashboard → Workers & Pages → Create → Pages → Direct Upload দিয়ে এই ফোল্ডার deploy করার আগে মনে রাখুন: Functions সমর্থনসহ Pages project deploy করার জন্য Git integration অথবা Wrangler ব্যবহার করা সবচেয়ে নির্ভরযোগ্য। Dashboard-এর plain drag-and-drop deployment Functions চালাতে নাও পারে।

সুপারিশকৃত পদ্ধতি:
- Node.js LTS ইনস্টল করুন: https://nodejs.org/
- Terminal/CMD-তে এই project folder-এ যান।
- Wrangler ইনস্টল/চালান: `npx wrangler pages deploy . --project-name vellora-landing`
- `wrangler.toml`-এ Pages-এর output directory `.` রাখা হয়েছে। আপনার deployment setup অনুযায়ী Wrangler D1 binding সংযুক্ত করুন।
- বিকল্পভাবে GitHub repo যুক্ত করে Cloudflare Pages project তৈরি করুন, তারপর Settings → Functions → D1 database bindings-এ variable name `DB` হিসেবে D1 bind করুন।

## 4. Secrets সেট করুন (অত্যন্ত জরুরি)
Cloudflare Pages project → Settings → Variables and Secrets:
- `ADMIN_PASSWORD`: শক্তিশালী, ইউনিক admin password
- `SESSION_SECRET`: অন্তত 32 random characters-এর গোপন value

Production secrets কখনো HTML/JS ফাইলে রাখবেন না। Secret পরিবর্তনের পর নতুন deployment করুন। HTTPS ব্যবহার করুন।

## 5. Admin ব্যবহার
- Public site: `/`
- Admin login: `/admin/`
- প্রথমে Admin password দিয়ে login করুন।
- Sidebar থেকে menu বেছে field পরিবর্তন করে Save changes চাপুন।
- `example.com` placeholder URL নিজের অনুমোদিত external URL দিয়ে পরিবর্তন করুন।
- Gallery items JSON field-এ array of objects দিন: `[{ "title":"Item 1", "description":"Description", "image":"https://example.com/image.jpg" }]`

## 6. বর্তমান সীমা ও নিরাপত্তা
- Admin login-এ shared password ব্যবহার করা হয়েছে; multi-admin accounts/roles, password reset, rate limiting এবং audit log এখনো তৈরি হয়নি। বাস্তব ব্যবহার/বাণিজ্যিক প্রকাশের আগে এগুলো যোগ করা উচিত।
- Analytics হলো basic event count; unique visitors নয়, এবং privacy/cookie notice ও data-retention policy যোগ করা উচিত।
- Image upload সরাসরি implement করা হয়নি; এখন public image URL ব্যবহার করা হয়. Upload চাইলে R2 এবং file validation যোগ করতে হবে.
- Visitor/registration data capture বাস্তব registration form/backend যোগ করার পর மட்டுமே সম্ভব. এই starter-এ registration form নেই.
- `partner.url` and `popup.url` both configurable; public site popup uses `popup.url`. Ensure links are transparent and compliant with ad-network policies.
- `wrangler.toml` database ID placeholder-ஐ மாற்றாமல் deploy செய்ய வேண்டாம்.
