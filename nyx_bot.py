import discord
from discord.ext import commands
import os
import json
import random
import string
from dotenv import load_dotenv

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')
KEYS_FILE = os.path.join(os.path.dirname(__file__), 'keys.json')

def load_keys():
    if not os.path.exists(KEYS_FILE):
        return {}
    with open(KEYS_FILE, 'r') as f:
        return json.load(f)

def save_keys(keys):
    with open(KEYS_FILE, 'w') as f:
        json.dump(keys, f, indent=2)

def generate_key():
    return 'NYX-' + ''.join(random.choices(string.ascii_uppercase + string.digits, k=12))

intents = discord.Intents.default()
intents.message_content = True
intents.members = True
bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    await bot.tree.sync()
    print(f'✅ NyxBot Online as {bot.user}')

@bot.tree.command(name='sendverifypanel', description='Send verification panel (Admin only)')
@discord.app_commands.checks.has_permissions(administrator=True)
async def sendverifypanel(interaction: discord.Interaction):
    embed = discord.Embed(title='🔒 Nyx AimHub Verification', description='Click below to get your key and access the hub.', color=0xFF00FF)
    view = discord.ui.View(timeout=None)
    button = discord.ui.Button(label='Verify & Get Key', style=discord.ButtonStyle.blurple, emoji='🔑')

    async def callback(i: discord.Interaction):
        keys = load_keys()
        user_id = str(i.user.id)
        if user_id in keys:
            key = keys[user_id]['key']
            await i.response.send_message(f'✅ You already have a key!\n\nYour key: `{key}`\n\n**Script:**\n```\nloadstring(game:HttpGet("https://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nix_hub.lua"))()\n```', ephemeral=True)
            return
        key = generate_key()
        keys[user_id] = {'key': key, 'username': str(i.user)}
        save_keys(keys)
        await i.response.send_message(f'✅ Verified! Your key:\n\n`{key}`\n\n**Script:**\n```\nloadstring(game:HttpGet("https://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nix_hub.lua"))()\n```', ephemeral=True)

    button.callback = callback
    view.add_item(button)
    await interaction.channel.send(embed=embed, view=view)
    await interaction.response.send_message('Panel sent!', ephemeral=True)

@bot.tree.command(name='checkkey', description='Check if a key is valid')
async def checkkey(interaction: discord.Interaction, key: str):
    keys = load_keys()
    for user_id, data in keys.items():
        if data['key'] == key:
            await interaction.response.send_message(f'✅ Valid key! Belongs to: {data["username"]}', ephemeral=True)
            return
    await interaction.response.send_message('❌ Invalid key!', ephemeral=True)

@bot.tree.command(name='revokekey', description='Revoke a users key (Admin only)')
@discord.app_commands.checks.has_permissions(administrator=True)
async def revokekey(interaction: discord.Interaction, user: discord.Member):
    keys = load_keys()
    user_id = str(user.id)
    if user_id in keys:
        del keys[user_id]
        save_keys(keys)
        await interaction.response.send_message(f'✅ Key revoked for {user}', ephemeral=True)
    else:
        await interaction.response.send_message(f'❌ No key found for {user}', ephemeral=True)

bot.run(TOKEN)
