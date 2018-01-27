json.extract! issue, :id
json.likes issue.get_likes.size
json.samples issue.issue_items

