# 📋 PROJECT RULES - QUY TẮC DỰ ÁN

> **BẮT BUỘC** - Tất cả thành viên trong team phải đọc và tuân thủ nghiêm ngặt các quy tắc này.

---

## 🎯 NGUYÊN TẮC CỐT LÕI

### 1. **QUALITY FIRST** 
- Code phải clean, readable, maintainable
- Luôn viết tests cho features mới
- Không được merge code có lỗi hoặc warnings

### 2. **TEAM CONSISTENCY**
- Follow đúng coding standards đã định
- Sử dụng chung architecture và patterns
- Không tự ý thay đổi cấu trúc project

### 3. **DOCUMENTATION DRIVEN**
- Document mọi thay đổi quan trọng
- Update guides khi cần thiết  
- Code phải self-documenting

---

## 📚 TÀI LIỆU BẮT BUỘC PHẢI ĐỌC

| Tài liệu | Mô tả | Trạng thái |
|----------|-------|------------|
| **CODING_STANDARDS.md** | Coding standards & project structure | ✅ Bắt buộc |
| **BLOC_GUIDE.md** | BLoC pattern guidelines | ✅ Bắt buộc |
| **README.md** | Project overview & setup | ✅ Bắt buộc |

---

## 🏗️ QUY TẮC DEVELOPMENT

### **Code Standards** 
- ✅ **PHẢI** follow `CODING_STANDARDS.md`
- ✅ **PHẢI** sử dụng Clean Architecture (data/domain/presentation)
- ✅ **PHẢI** sử dụng BLoC cho state management
- ✅ **PHẢI** viết tests cho mọi logic business
- ❌ **KHÔNG** được hardcode values
- ❌ **KHÔNG** được bỏ qua lint warnings

### **File Structure**
```
lib/
├── core/          # Utilities & base classes
├── config/        # App configuration  
├── data/          # Data layer (API, local storage)
├── domain/        # Business logic & entities
└── presentation/  # UI layer (pages, widgets, BLoC)
```

### **Naming Rules**
- Files: `snake_case` (user_profile_page.dart)
- Classes: `PascalCase` (UserProfilePage)
- Variables/Functions: `camelCase` (getUserProfile)
- Constants: `SCREAMING_SNAKE_CASE` (API_BASE_URL)

---

## 🔄 WORKFLOW BẮT BUỘC

### **Trước khi code:**
1. ✅ Đọc kỹ requirements
2. ✅ Tạo branch từ `develop`: `feature/feature-name`  
3. ✅ Kiểm tra architecture pattern phù hợp

### **Trong khi code:**
1. ✅ Follow `CODING_STANDARDS.md` và `BLOC_GUIDE.md`
2. ✅ Viết tests song song với features
3. ✅ Commit thường xuyên với message rõ ràng
4. ✅ Run `flutter analyze` trước khi commit

### **Trước khi tạo PR:**
1. ✅ Run full test suite: `flutter test`
2. ✅ Đảm bảo không có lint errors
3. ✅ Update documentation nếu cần
4. ✅ Self-review code một lần nữa

### **Code Review:**
- 🔍 **PHẢI** có ít nhất 1 approval trước khi merge
- 🔍 Review viết comment constructive, không personal
- 🔍 Check standards compliance
- 🔍 Verify tests coverage

---

## 🧪 TESTING REQUIREMENTS

### **Bắt buộc:**
- ✅ Unit tests cho tất cả UseCases
- ✅ BLoC tests cho tất cả BLoCs  
- ✅ Widget tests cho complex widgets
- ✅ Test coverage >= 80%

### **Commands:**
```bash
# Run tests
flutter test

# Generate coverage
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

---

## 📝 GIT CONVENTIONS

### **Branch Naming:**
- `feature/user-login` - New features
- `bugfix/login-error` - Bug fixes  
- `hotfix/critical-issue` - Urgent fixes
- `release/v1.2.0` - Release branches

### **Commit Messages:**
```
<type>(<scope>): <subject>

feat(auth): add user login functionality
fix(ui): resolve button alignment issue  
docs(readme): update setup instructions
test(bloc): add user bloc tests
```

### **PR Template:**
- ✅ Mô tả changes rõ ràng
- ✅ Link related issues
- ✅ Add screenshots nếu có UI changes
- ✅ Checklist completed

---

## 🚫 CẤM TUYỆT ĐỐI

### **Code Quality:**
- ❌ **KHÔNG** commit code có errors/warnings
- ❌ **KHÔNG** skip tests cho logic business
- ❌ **KHÔNG** hardcode strings, APIs, configs
- ❌ **KHÔNG** sử dụng `print()` trong production
- ❌ **KHÔNG** ignore lint rules without justification

### **Architecture:**
- ❌ **KHÔNG** vi phạm Clean Architecture layers
- ❌ **KHÔNG** skip BLoC cho state management
- ❌ **KHÔNG** direct API calls từ UI layer
- ❌ **KHÔNG** mix business logic với UI

### **Workflow:**
- ❌ **KHÔNG** commit trực tiếp vào `main`/`develop`
- ❌ **KHÔNG** force push lên shared branches
- ❌ **KHÔNG** merge PR chưa được review
- ❌ **KHÔNG** delete shared branches

---

## ⚡ QUICK CHECKLIST

### **Mỗi khi bắt đầu làm việc:**
- [ ] Pull latest code từ `develop`
- [ ] Đọc lại requirements
- [ ] Tạo branch theo naming convention

### **Trước mỗi commit:**
- [ ] `flutter analyze` - no errors
- [ ] `flutter test` - all pass
- [ ] Code follows standards
- [ ] Commit message theo format

### **Trước mỗi PR:**
- [ ] Self-review code
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Screenshots attached (nếu có UI)

### **Code Review:**
- [ ] Architecture compliance
- [ ] Performance considerations  
- [ ] Error handling proper
- [ ] Tests coverage adequate

---

## 🆘 KHI CÓ VẤN ĐỀ

### **Technical Issues:**
1. Check `CODING_STANDARDS.md` hoặc `BLOC_GUIDE.md`
2. Search trong existing code examples
3. Ask team members
4. Create GitHub issue nếu cần

### **Process Issues:**
1. Review lại PROJECT_RULES này
2. Discuss với team lead
3. Update rules nếu cần (với agreement)

---

## 📊 METRICS & MONITORING

### **Code Quality Metrics:**
- Test coverage >= 80%
- Zero lint warnings
- Performance benchmarks met
- No security vulnerabilities

### **Team Metrics:**
- PR review time < 24h
- Build success rate > 95%
- Documentation up-to-date
- Standards compliance 100%

---

## 🔄 UPDATE POLICY

- **Rules này được update khi:**
  - Team agreement (>80% vote)
  - New requirements từ stakeholders
  - Technical improvements needed

- **Notification:**
  - All updates phải notify toàn team
  - Grace period 1 week cho major changes
  - Document changes trong Git history

---

> **⚠️ LƯU Ý:** Vi phạm rules có thể dẫn đến code review reject, re-work, hoặc discussion với team lead. Mục tiêu là maintain quality và consistency, không phải punishment.

**Last Updated:** 2024-12-21  
**Version:** 1.0  
**Next Review:** Monthly team meeting 