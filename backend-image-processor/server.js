const express = require('express');
const bodyParser = require('body-parser');
const sharp = require('sharp');

const app = express();
const cors = require('cors'); // Import the cors package
app.use(cors()); // Enable CORS for all routes

app.use(bodyParser.json({ limit: '50mb' })); // to support JSON-encoded bodies

app.post('/process_image', async (req, res) => {
    const { image_data } = req.body;

    if (!image_data) {
        return res.status(400).json({ error: 'No image data provided' });
    }

    try {
        const imgBuffer = Buffer.from(image_data, 'base64');
        const grayImgBuffer = await sharp(imgBuffer)
            .grayscale()
            .toBuffer();
        const encodedGray = grayImgBuffer.toString('base64');

        res.json({ processed_image: encodedGray });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
