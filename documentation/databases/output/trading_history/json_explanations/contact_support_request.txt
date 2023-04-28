{
    <!-- auto generated -->
    "_id": "11512345bca0a50d0f8a8c2b",

    <!-- name of person sending a request -->
    "name": "Jim Morrison",

    <!-- email of person sending a request -->
    "email": "rock@only.rock",

    <!-- time (ISODate) at which the request was sent -->
    "time": "2023-04-18T14:29:00Z",

    <!-- message for the support to respond to -->
    "msg": "Do I need to have experience to be someone's broker?",

    <!-- [Optional] info if the request was processed -->
    "processing": {
        <!-- id of admin user who labeled the request being processed
             in SQL db - Administrator entity - IdUser
        -->
        "admin_id": 2,

        <!-- status of the request being processed:
             DONE: done processing,
             PENDING: still being procesed, for further info contact admin user (admin_id)
        -->
        "status": "DONE",

        <!-- [Optional] comment left by the admin user (admin_id), independent of status -->
        "comment": "Solved over email."
    }
}
