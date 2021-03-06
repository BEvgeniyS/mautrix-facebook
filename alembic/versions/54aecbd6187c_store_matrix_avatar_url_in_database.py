"""Store Matrix avatar URL in database

Revision ID: 54aecbd6187c
Revises: 76cb89f6b352
Create Date: 2020-06-15 13:52:37.932842

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '54aecbd6187c'
down_revision = '76cb89f6b352'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('portal', schema=None) as batch_op:
        batch_op.add_column(sa.Column('avatar_url', sa.String(length=255), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('portal', schema=None) as batch_op:
        batch_op.drop_column('avatar_url')

    # ### end Alembic commands ###
