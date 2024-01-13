$version: "2"

namespace com.weekly.budgeter.common.error

@error("client")
@httpError(400)
@documentation("The request fails to satisfy the constraints specified.")
structure ValidationError {
    @required
    message: String
}

@error("client")
@httpError(402)
@documentation("Caller has exceeded the limits provisioned for your account. (i.e. You have crated too many budgets).")
structure ResourceLimitExceededError {
    @required
    message: String
}

@error("client")
@httpError(403)
@documentation("Caller does not have sufficient permissions to make request.")
structure AccessDeniedError {
    @required
    message: String
}

@error("client")
@httpError(404)
@documentation("No resource found for given identifier(s).")
structure ResourceNotFoundError {
    @required
    message: String
}

@error("client")
@httpError(409)
@documentation("The resource conflicts with an existing resource.")
structure ResourceConflictError {
    @required
    message: String
}


@error("client")
@retryable
@httpError(429)
@documentation("The request was denied due to request throttling.")
structure ThrottlingError {
    @required
    message: String
}

@error("server")
@retryable
@httpError(500)
@documentation("The service is unable to process the request at this time.")
structure InternalServerError {
    @required
    message: String
}
