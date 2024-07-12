<template>
  <div id="app">
    <h1>Image Processing Pipeline</h1>
    <input type="file" @change="onFileChange" />
    <button @click="uploadImage">Upload Image</button>
    <div v-if="message">{{ message }}</div>
    <div v-if="processedImage">
      <h2>Processed Image:</h2>
      <img :src="processedImage" />
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      selectedFile: null,
      processedImage: null,
      message: ''
    };
  },
  methods: {
    onFileChange(event) {
      this.selectedFile = event.target.files[0];
    },
    async uploadImage() {
      if (!this.selectedFile) return;

      const formData = new FormData();
      formData.append('file', this.selectedFile);

      try {
        this.message = 'Uploading image...';

        const response = await axios.post('/api/upload', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        });

        if (response.data.processed_image) {
          this.processedImage = `data:image/jpeg;base64,${response.data.processed_image}`;
          this.message = 'Image processed successfully!';
        } else {
          this.message = 'Processing failed. No image returned.';
        }
      } catch (error) {
        console.error('Error processing image:', error);
        this.message = 'Error processing image';
      }
    }
  }
};
</script>

<style>
/* Add any styles you need here */
</style>
