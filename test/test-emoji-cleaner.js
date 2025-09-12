/**
 * Test script for Universal Emoji Cleaner
 */

const fs = require('fs');
const path = require('path');
const { removeEmojis, analyzeFile } = require('../emoji-cleaner');

// สร้างไฟล์ทดสอบ
function createTestFiles() {
    const testDir = path.join(__dirname, 'temp');
    
    if (!fs.existsSync(testDir)) {
        fs.mkdirSync(testDir);
    }
    
    // ไฟล์ JavaScript ที่มีอิโมจิ
    const jsContent = `
// 🎉 Welcome component
function Welcome() {
    return <div>Hello World! 🌍</div>;
}

/* 
🚀 This is a rocket comment
with multiple emojis 🎯🔥
*/

export default Welcome; // 💫
`;
    
    // ไฟล์ HTML ที่มีอิโมจิ
    const htmlContent = `
<!DOCTYPE html>
<html>
<head>
    <title>Test Page 🎯</title>
</head>
<body>
    <!-- 🌟 Main content -->
    <h1>Welcome 🎉</h1>
    <p>This is a test page with emojis 🚀🔥</p>
    <!-- 
    🎪 Multi-line comment
    with emojis 🎨🎭
    -->
</body>
</html>
`;
    
    fs.writeFileSync(path.join(testDir, 'test.js'), jsContent);
    fs.writeFileSync(path.join(testDir, 'test.html'), htmlContent);
    
    return testDir;
}

// ทดสอบฟังก์ชัน removeEmojis
function testRemoveEmojis() {
    console.log('🧪 Testing removeEmojis function...');
    
    const testText = 'Hello 🌍 World 🎉 Test 🚀';
    const result = removeEmojis(testText);
    
    console.log(`Input: "${testText}"`);
    console.log(`Output: "${result.content}"`);
    console.log(`Emojis removed: ${result.emojiCount}`);
    console.log(`Changed: ${result.changed}`);
    
    if (result.emojiCount === 3 && result.content === 'Hello  World  Test ') {
        console.log('✅ removeEmojis test passed');
        return true;
    } else {
        console.log('❌ removeEmojis test failed');
        return false;
    }
}

// ทดสอบฟังก์ชัน analyzeFile
function testAnalyzeFile() {
    console.log('\n🧪 Testing analyzeFile function...');
    
    const testDir = createTestFiles();
    
    // ทดสอบไฟล์ JavaScript
    const jsFile = path.join(testDir, 'test.js');
    const jsResult = analyzeFile(jsFile, true, true); // dry-run, verbose
    
    console.log('JavaScript file analysis:');
    console.log(`- Processed: ${jsResult.processed}`);
    console.log(`- Emojis: ${jsResult.emojiCount}`);
    console.log(`- Comments: ${jsResult.commentCount}`);
    
    // ทดสอบไฟล์ HTML
    const htmlFile = path.join(testDir, 'test.html');
    const htmlResult = analyzeFile(htmlFile, true, true); // dry-run, verbose
    
    console.log('HTML file analysis:');
    console.log(`- Processed: ${htmlResult.processed}`);
    console.log(`- Emojis: ${htmlResult.emojiCount}`);
    console.log(`- Comments: ${htmlResult.commentCount}`);
    
    // ทำความสะอาด
    fs.rmSync(testDir, { recursive: true });
    
    if (jsResult.processed && htmlResult.processed && 
        jsResult.emojiCount > 0 && htmlResult.emojiCount > 0) {
        console.log('✅ analyzeFile test passed');
        return true;
    } else {
        console.log('❌ analyzeFile test failed');
        return false;
    }
}

// รันการทดสอบ
function runTests() {
    console.log('🚀 Running Universal Emoji Cleaner Tests\n');
    
    let passedTests = 0;
    let totalTests = 2;
    
    if (testRemoveEmojis()) passedTests++;
    if (testAnalyzeFile()) passedTests++;
    
    console.log(`\n📊 Test Results: ${passedTests}/${totalTests} passed`);
    
    if (passedTests === totalTests) {
        console.log('🎉 All tests passed!');
        process.exit(0);
    } else {
        console.log('❌ Some tests failed!');
        process.exit(1);
    }
}

// เรียกใช้งานถ้าไม่ใช่การ import
if (require.main === module) {
    runTests();
}

module.exports = {
    testRemoveEmojis,
    testAnalyzeFile,
    runTests
};
