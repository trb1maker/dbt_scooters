{% docs event_types %}

# Event Types

The `event_types` table serves as a foundational reference dataset that provides a mapping between unique event type identifiers (`type_id`) and their corresponding descriptive names (`type`). This table is crucial for translating numerical event type codes found in user activity logs into human-readable descriptions, facilitating better understanding and analysis of user behavior related to various application features.

## Columns

- **type_id**: A unique integer identifier for each event type. This ID is used in user event tables to denote specific actions performed by users. The `type_id` acts as a foreign key that links user events to their descriptions in this table.

- **type**: A string representing the textual name of the event type. It provides a clear and concise description of the action associated with each `type_id`. This column enhances the interpretability of event data by offering an easily understandable label for each event type.

## Usage

The `event_types` table is primarily used in analytics and reporting to decode event type identifiers in user activity datasets. By joining this table with event logs, analysts can produce more intuitive reports and dashboards that display user interactions in a descriptive manner. This mapping enables more effective segmentation, tracking, and analysis of user activities, such as:

- **start_search**: Represents the initiation of a search process by a user.
- **book_scooter**: Indicates that a user has booked a scooter.
- **release_scooter**: Signifies that a user has released a previously booked scooter.
- **cancel_search**: Denotes the cancellation of a search process by a user.

By utilizing the `event_types` table, organizations can gain deeper insights into user engagement with different features and optimize their services accordingly.

{% enddocs %}