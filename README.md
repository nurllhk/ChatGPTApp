# Chat GPT App



| |  |
|:---:|:---:|
| ![Simulator Screen Shot - iPhone 14 Pro - 2023-07-09 at 18 02 43](https://github.com/nurllhk/ChatGPTApp/assets/79688257/5b0a2f90-8c16-41df-b596-2ad5d52689e9) | ![Simulator Screen Shot - iPhone 14 Pro - 2023-07-09 at 18 03 36](https://github.com/nurllhk/ChatGPTApp/assets/79688257/49b06bb1-8347-4728-8246-a902f91b54b5) |


<br>



https://github.com/nurllhk/ChatGPTApp/assets/79688257/df201b14-2c0f-4c04-871f-4e4e60f07130





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



