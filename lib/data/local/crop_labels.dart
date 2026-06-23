// Index N in this list corresponds to output neuron N in the model's
// softmax layer. Do NOT reorder.

class CropLabels {
  CropLabels._();

  static const List<String> labels = [
    'Corn___Common_Rust',         // 0
    'Corn___Gray_Leaf_Spot',      // 1
    'Corn___Healthy',             // 2
    'Corn___Northern_Leaf_Blight',// 3
    'Cotton___Bacterial_Blight',  // 4
    'Cotton___Curl_Virus',        // 5
    'Cotton___Fusarium_Wilt',     // 6
    'Cotton___Healthy',           // 7
    'Potato___Early_Blight',      // 8
    'Potato___Healthy',           // 9
    'Potato___Late_Blight',       // 10
    'Rice___Brown_Spot',          // 11
    'Rice___Healthy',             // 12
    'Rice___Leaf_Blast',          // 13
    'Rice___Neck_Blast',          // 14
    'Sugarcane___Healthy',        // 15
    'Sugarcane___Mosaic',         // 16
    'Sugarcane___Red_Rot',        // 17
    'Sugarcane___Rust',           // 18
    'Sugarcane___Yellow',         // 19
    'Tomato___Bacterial_Spot',    // 20
    'Tomato___Early_Blight',      // 21
    'Tomato___Healthy',           // 22
    'Tomato___Late_Blight',       // 23
    'Tomato___Leaf_Mold',         // 24
    'Tomato___Septoria_Leaf_Spot',// 25
    'Tomato___Tomato_Mosaic_Virus',// 26
    'Tomato___Yellow_Leaf_Curl_Virus', // 27
    'Wheat___Brown_Rust',         // 28
    'Wheat___Healthy',            // 29
    'Wheat___Yellow_Rust',        // 30
  ];
}
