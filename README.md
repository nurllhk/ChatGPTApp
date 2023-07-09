# Chat GPT App

|  | |
|:---:|:---:|
| ![Simulator Screen Shot - iPhone 14 Pro - 2023-07-09 at 18 02 43](https://github.com/nurllhk/ChatGPTApp/assets/79688257/08412fc6-fe72-45d1-b849-bed9e309a4ff) | ![Simulator Screen Shot - iPhone 14 Pro - 2023-07-09 at 18 03 36](https://github.com/nurllhk/ChatGPTApp/assets/79688257/2af7813f-ceb0-425b-a4cd-b5aed04f5c01) |


<br>





https://github.com/nurllhk/ChatGPTApp/assets/79688257/d3b5fb22-7cbf-4259-ae3f-3055f8d1e8d2




# GPT API usage

```sh 
  Future<String> createResponse(String newProm) async {
    const api = DefaultApi.API;
    var uri = Uri.https('api.openai.com', '/v1/completions');

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $api'
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'prompt': newProm,
          'temperature': 0,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0
        }));

    if (response.statusCode == 200) {
      Map<String, dynamic> messageResponse = jsonDecode(response.body);
      if (messageResponse['choices'] != null &&
          messageResponse['choices'].length > 0) {
        return messageResponse['choices'][0]['text'];
      } else {
        return '';
      }
    } else {
      throw Exception(
          'Failed to create ${response.statusCode}');
    }
  }
 ```





# Other parameters you can use 

```sh 
model
prompt
suffix
max_tokens
temperature
top_p
n
stream
logprobs
echo
stop
presence_penalty
frequency_penalty
best_of
logit_bias
user

 ```



