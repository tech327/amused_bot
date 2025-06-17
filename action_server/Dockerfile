FROM rasa/rasa-sdk:3.6.16

WORKDIR /app

COPY ./actions /app/actions

CMD ["start", "--actions", "actions", "--port", "5055"]