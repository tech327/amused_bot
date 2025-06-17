#10 9.567   File "/opt/venv/lib/python3.10/site-packages/rasa/model_training.py", line 207, in train
#10 9.567     return _train_graph(
#10 9.567   File "/opt/venv/lib/python3.10/site-packages/rasa/model_training.py", line 249, in _train_graph
#10 9.567     config, _missing_keys, _configured_keys = recipe.auto_configure(
#10 9.567   File "/opt/venv/lib/python3.10/site-packages/rasa/engine/recipes/default_recipe.py", line 963, in auto_configure
#10 9.567     DefaultV1Recipe._dump_config(
#10 9.567   File "/opt/venv/lib/python3.10/site-packages/rasa/engine/recipes/default_recipe.py", line 1084, in _dump_config
#10 9.568     rasa.shared.utils.io.write_text_file("".join(updated_lines), config_file_path)
#10 9.568   File "/opt/venv/lib/python3.10/site-packages/rasa/shared/utils/io.py", line 119, in write_text_file
#10 9.568     with open(file_path, mode, encoding=encoding) as file:
#10 9.568 PermissionError: [Errno 13] Permission denied: 'config.yml'
#10 ERROR: process "/bin/bash -o pipefail -c rasa train" did not complete successfully: exit code: 1
------
 > [4/4] RUN rasa train:
9.567     return _train_graph(
9.567   File "/opt/venv/lib/python3.10/site-packages/rasa/model_training.py", line 249, in _train_graph
9.567     config, _missing_keys, _configured_keys = recipe.auto_configure(
9.567   File "/opt/venv/lib/python3.10/site-packages/rasa/engine/recipes/default_recipe.py", line 963, in auto_configure
9.567     DefaultV1Recipe._dump_config(
9.567   File "/opt/venv/lib/python3.10/site-packages/rasa/engine/recipes/default_recipe.py", line 1084, in _dump_config
9.568     rasa.shared.utils.io.write_text_file("".join(updated_lines), config_file_path)
9.568   File "/opt/venv/lib/python3.10/site-packages/rasa/shared/utils/io.py", line 119, in write_text_file
9.568     with open(file_path, mode, encoding=encoding) as file:
9.568 PermissionError: [Errno 13] Permission denied: 'config.yml'
------
Dockerfile:12
--------------------
  10 |     
  11 |     # Train the model
  12 | >>> RUN rasa train
  13 |     
  14 |     # Expose port for Render or local testing
--------------------
error: failed to solve: process "/bin/bash -o pipefail -c rasa train" did not complete successfully: exit code: 1