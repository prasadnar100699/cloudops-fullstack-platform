from flask import Blueprint, jsonify, request
from .models import db, User

api = Blueprint("api", __name__)


@api.route("/users", methods=["GET"])
def get_users():

    users = User.query.all()

    return jsonify([
        {"id": u.id, "name": u.name}
        for u in users
    ])


@api.route("/users", methods=["POST"])
def add_user():

    data = request.json

    user = User(name=data["name"])

    db.session.add(user)
    db.session.commit()

    return jsonify({"message": "User created"}), 201
