import io
from vws import VWS

# Title: Vuforia VWS Target Adder
# Author: VWS-Python Documentation
def add_image_to_database(input_image_path, output_name):
    """Adds image to target image database"""
    
    server_access_key = '7728643416d8fc18149de07c8eb7463f86b7148a'
    server_secret_key = 'a5dc6f1da7a86e460640be7e0f5a1f9f3351bfbc'
    
    vws_client = VWS(
        server_access_key=server_access_key,
        server_secret_key=server_secret_key,
    )

    with open(input_image_path, 'rb') as my_image_file:
        my_image = io.BytesIO(my_image_file.read())

    target_id = vws_client.add_target(
        name=output_name,
        width=1,
        image=my_image,
        active_flag=True,
        application_metadata=None,
    )
    
    vws_client.wait_for_target_processed(target_id=target_id)
    
    return True