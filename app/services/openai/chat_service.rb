require 'httparty'

module Openai
  class ChatService
    include HTTParty
    base_uri 'https://api.openai.com/v1'

    def initialize(prompt:, model: "gpt-4o-mini", system_prompt: "You are a helpful assistant.")
      @model = model
      @messages = [
        { role: "system", content: system_prompt },
        { role: "user", content: prompt }
      ]
      @headers = {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}"
      }
    end

    def call
      response = self.class.post(
        "/chat/completions",
        headers: @headers,
        body: {
          model: @model,
          messages: @messages
        }.to_json
      )

      if response.success?
        response.parsed_response["choices"][0]["message"]["content"]
      else
        Rails.logger.error("OpenAI Error: #{response.body}")
        "Sorry, something went wrong."
      end
    end
  end
end
