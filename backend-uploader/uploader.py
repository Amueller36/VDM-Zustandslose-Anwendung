from flask import Flask, request, jsonify
from flask_cors import CORS

import base64
import requests

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/upload', methods=['POST'])
def upload_image():
    try:
        print("Uploading and Processing image...")
        file = request.files['file']
        file_data = file.read()
        encoded = base64.b64encode(file_data).decode('utf-8')
        
        # Log the encoded image data for debugging
        print(f"Encoded image data: {encoded[:100]}...")

        response = requests.post('http://stateless-app-image-processor-svc:5000/process_image', json={'image_data': encoded})

        # Log the response text for debugging
        print(f"Response from processor: {response.text}")

        # Check if the response is empty
        if not response.text:
            raise ValueError("Empty response from processor service")

        img_result = response.json()

        # Check if the JSON contains the expected key
        if 'processed_image' not in img_result:
            raise ValueError("Invalid response format from processor service")

        return jsonify({"processed_image": img_result['processed_image']})

    except requests.exceptions.RequestException as e:
        print(f"Error communicating with processor service: {e}")
        return jsonify({"error": f"Error communicating with processor service: {e}"}), 500
    except ValueError as e:
        print(f"Error processing response: {e}")
        return jsonify({"error": f"Error processing response: {e}"}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
