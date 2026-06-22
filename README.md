# Fasal AI

Fasal AI is a modern Flutter application for crop disease detection that helps farmers identify crop diseases directly from images captured using the device camera or selected from the gallery.

The application is designed with an offline-first architecture and is capable of running disease detection completely on-device using a MobileNet-based machine learning model.

---

## Features

- Capture crop images using the device camera
- Select crop images from the gallery
- Offline crop and disease detection using MobileNet
- Crop identification and disease classification
- Confidence scoring for predictions
- Disease treatment recommendations
- Prevention and precaution guidelines
- Disease library
- Crop guide section
- Local diagnosis history
- User profile management
- Works without an internet connection

---

## Technology Stack

### Frontend

- Flutter
- Go Router
- Material 3

### Local Storage

- Isar Database
- Local offline persistence and diagnosis history storage

### Machine Learning

- TensorFlow Lite
- MobileNet-based image classification model

---

## Offline AI Architecture

Fasal AI is designed to perform crop disease detection entirely on the user's device.

### Inference Flow

1. User captures or selects a crop image.
2. Image is preprocessed to match the MobileNet model input size.
3. TensorFlow Lite runs inference locally.
4. The model returns:
   - Crop name
   - Disease name (or Healthy)
   - Confidence score
5. The application maps the predicted class to disease information stored locally.
6. A diagnosis report is generated and displayed to the user.

---

## MobileNet Integration

The application is designed around a MobileNet-based TensorFlow Lite model.

### Model Input

- Crop image
- Resized and normalized before inference

### Model Output

The model predicts a class label that represents:

- Crop type
- Disease type

Examples:

- Tomato - Early Blight
- Tomato - Late Blight
- Potato - Healthy
- Rice - Brown Spot

---

## Disease Knowledge Base

Model predictions are separated from disease information.

Each disease class is mapped to locally stored metadata containing:

- Disease description
- Symptoms
- Severity level
- Treatment recommendations
- Prevention measures
- Next steps for farmers

This architecture allows disease information to be updated independently of the machine learning model.

---

## Diagnosis Pipeline

```text
Camera / Gallery
        ↓
 Image Preprocessing
        ↓
 MobileNet (TensorFlow Lite)
        ↓
 Crop + Disease Prediction
        ↓
 Local Disease Knowledge Base
        ↓
 Diagnosis Report
        ↓
 Stored In Local History
```

---

## Project Structure

```text
lib/
├── core/
├── data/
├── features/
│   ├── home/
│   ├── scan/
│   ├── diagnosis/
│   ├── profile/
│   ├── onboarding/
│   └── splash/
├── routing/
└── shared/
```

---

## Future Improvements

- Multiple crop model support
- Model updates without app redesign
- Expanded disease database
- Regional crop recommendations
- Multi-language support
- Advanced disease analytics

---

## Vision

Fasal AI aims to make crop disease detection accessible, fast, and reliable by providing farmers with an offline-first experience that works directly on their devices without requiring continuous internet connectivity.