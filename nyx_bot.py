import discord
from discord.ext import commands
import os
import json
import base64
from dotenv import load_dotenv
import asyncio

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')
VERIFY_CODE = os.getenv('VERIFY_CODE', 'NyxSecretHWID2026')

intents = discord.Intents.default()
intents.message_content = True
intents.members = True
bot = commands.Bot(command_prefix='!', intents=intents)

hwid_db = {}

@bot.event
async def on_ready():
    print(f'✅ NyxBot Online as {bot.user}')

@bot.tree.command(name='sendverifypanel', description='Send verification panel (Admin only)')
@commands.has_permissions(administrator=True)
async def sendverifypanel(interaction: discord.Interaction):
    embed = discord.Embed(title='🔒 Nyx AimHub Verification', description='Click below to get access.', color=0xFF00FF)
    view = discord.ui.View()
    button = discord.ui.Button(label='Verify & Get Hub', style=discord.ButtonStyle.pink, emoji='🔑')
    
    async def callback(i: discord.Interaction):
        await i.response.send_message('Check your DMs for instructions.', ephemeral=True)
        def check(m): return m.author == i.user and isinstance(m.channel, discord.DMChannel)
        try:
            msg = await bot.wait_for('message', check=check, timeout=120)
            user_hwid = msg.content.strip()
            if user_hwid:
                await i.user.send(f'✅ Verified! Your HWID is registered.\n\n**Nyx AimHub Script:**\nhttps://raw.githubusercontent.com/yespleaselet2-create/AimHub/main/nyx_hub.lua')
            else:
                await i.user.send('❌ Invalid.')
        except:
            await i.user.send('⏰ Timeout.')
    
    button.callback = callback
    view.add_item(button)
    await interaction.channel.send(embed=embed, view=view)
    await interaction.response.send_message('Panel sent!', ephemeral=True)

bot.run(TOKEN)
